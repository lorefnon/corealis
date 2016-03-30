class ApplicationSubmissionsController < ApplicationController

  include ConstraintViolationSupport

  layout 'single_panel'

  def new
    @opening = Opening.find params[:opening_id]
    @application_submission = @opening.application_submissions.build
    @application_submission.applicant = Applicant.new
  end

  def create
    @submission = ApplicationSubmission.new(application_submission_attributes)
    @submission.save_or_populate_applicant
    @submission.save!
    redirect_to application_submission_verdict_path(verdict: 'success')
  rescue ActiveRecord::RecordNotUnique => error
    if application_already_existed?(error)
      handle_duplicate_application_failure
    else
      raise error
    end
  end

  private

  def application_submission_attributes
    params
      .require(:application_submission)
      .permit(:cover_letter, :opening_id, applicant_attributes: %w[
        name email phone_number
      ])
  end

  def application_already_existed?(error)
    constraint_violation? error, 'index_application_submissions_on_applicant_id_and_opening_id'
  end

  def handle_duplicate_application_failure
    flash[:error] = 'You have already applied for this position'
    redirect_to application_submission_verdict_path(verdict: 'failure')
  end

end

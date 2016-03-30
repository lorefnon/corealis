class ApplicationSubmissionsController < ApplicationController

  layout 'single_panel'

  def new
    @opening = Opening.find params[:opening_id]
    @application_submission = @opening.application_submissions.build
    @application_submission.applicant = Applicant.new
  end

  def create
    @application_submission = ApplicationSubmission.new(application_submission_attributes)
    @application_submission.save!
    redirect_to application_submission_verdict_path(verdict: 'success')
  end

  private

  def application_submission_attributes
    params
      .require(:application_submission)
      .permit(:cover_letter, applicant_attributes: %w[
        name email phone_number
      ])
  end

end

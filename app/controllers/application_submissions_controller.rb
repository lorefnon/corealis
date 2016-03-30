class ApplicationSubmissionsController < ApplicationController

  def new
    @opening = Opening.find params[:opening_id]
    @application_submission = @opening.application_submissions.build
  end

  def create
  end

end

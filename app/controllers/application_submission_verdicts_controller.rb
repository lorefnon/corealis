class ApplicationSubmissionVerdictsController < ApplicationController
  def show
    @verdict = params[:verdict]
  end
end

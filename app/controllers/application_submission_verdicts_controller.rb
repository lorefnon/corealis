class ApplicationSubmissionVerdictsController < ApplicationController

  layout 'single_panel'

  def show
    @verdict = params[:verdict]
  end

end

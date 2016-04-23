class QuestionSubmissionPreviewController < ApplicationController

  def show
    @answer = Answer.find params[:id]
  end

end

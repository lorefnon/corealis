class QuizSessionPreviewController < ApplicationController

  before_action :ensure_admin_user

  def show
    @quiz_session = QuizSession.find params[:quiz_session_id]
    if next_question = @quiz_session.next_question
      @current_question = next_question.decorate
      @current_answer = @current_question.answers.build(quiz_session_id: @quiz_session.id)
    end
  end

end

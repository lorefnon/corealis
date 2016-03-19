module QuizSessions
  class AnswersController < ApplicationController

    before_action :load_quiz_session

    def create
      # TODO Handle applicant here
      @answer = @quiz_session.answers.create!(answer_params.merge(answerer: current_admin_user))
      if @current_question = @quiz_session.next_question
        @current_answer = @quiz_session.answers.new(question: @current_question)
      end
    end

    private

    def load_quiz_session
      @quiz_session = QuizSession.find params[:quiz_session_id]
    end

    def answer_params
      params.require(:answer).permit(:question_id, :details)
    end

  end
end

module QuizSessions
  class AnswersController < ApplicationController

    def create
      @answer = @quiz_session.answers.create!(answer_params)
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

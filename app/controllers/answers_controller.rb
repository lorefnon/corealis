class AnswersController < ApplicationController

  def create
    @answer = Answer.create!(answer_params)
    if @current_question = @quiz_session.next_question
      @current_answer = @quiz_session.answers.new(question: @current_question)
    end
  end

  private

  def answer_params
    params.require(:answer).permit(:quiz_session_id, :question_id, :details)
  end

end

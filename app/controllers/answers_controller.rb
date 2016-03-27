class AnswersController < ApplicationController

  def create
    @answer = Answer.create!(answer_params)
    @quiz_session = @answer.quiz_session
    if next_question = @quiz_session.next_question
      @current_question = next_question.decorate
      @current_answer = @quiz_session.answers.new(question: @current_question)
    end
  end

  private

  def answer_params
    params.require(:answer).permit(:quiz_session_id, :question_id, :details)
  end

end

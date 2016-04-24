class AnswersController < ApplicationController

  after_action :dispatch_creation_notification, only: :create

  def show
    @answer = Answer.find params[:id]
    @question = @answer.question.decorate
  end

  def create
    @answer = Answer.create!(answer_params)
    @quiz_session = @answer.quiz_session
    if next_question = @quiz_session.next_question
      @current_question = next_question.decorate
      @current_answer = @quiz_session.answers.new(question: @current_question)
    end
    @quiz_session.answers.reload
  end

  private

  def answer_params
    params
      .require(:answer)
      .permit(:quiz_session_id, :question_id, :details, :history)
  end

  def dispatch_creation_notification
    AnswerSubmissionNotificationDispatcherJob.perform_later @answer.id
  end

end

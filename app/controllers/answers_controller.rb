class AnswersController < ApplicationController

  before_action :load_answer, only: [:show, :update]
  after_action :dispatch_creation_notification, only: :create

  def show
    @question = @answer.question.decorate
  end

  def update
    @answer.update!(answer_params)
    @quiz_session = @answer.quiz_session
    if next_question = @quiz_session.next_question
      @current_question = next_question.decorate
      @current_answer = @quiz_session.answers.where(question: @current_question).first_or_create
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

  def load_answer
    @answer = Answer.find params[:id]
  end

end

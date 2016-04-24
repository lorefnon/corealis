class QuestionsController < ApplicationController

  before_action :ensure_admin_user

  def create
    create_question
    associate_question_with_quiz
  end

  def new
    @quiz_session_id = params[:quiz_session_id]
    @question = Question.new
  end

  private

  def create_question
    @question = Question.new(question_params)
    @question.admin_user = current_admin_user
    @question.save!
  end

  def associate_question_with_quiz
    return unless params[:quiz_session_id]
    quiz_session = QuizSession.find params[:quiz_session_id]
    QuizQuestionAssociator.create!(
      quiz_id: quiz_session.quiz_id,
      question_id: @question.id
    )
  end

  def question_params
    params
      .require(:question)
      .permit(:title, :description)
  end

end

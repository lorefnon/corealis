class QuestionsController < ApplicationController

  before_action :ensure_admin_user

  def create
    create_question
  end

  private

  def create_question
    @question = Question.new(question_params)
    @question.admin_user = current_admin_user
    @question.save!
  end

  def question_params
    params
      .require(:question)
      .permit(:title, :description)
  end

end

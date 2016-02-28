class QuizSessionsController < ApplicationController

  before_action :ensure_token_matches, only: :new
  before_action :use_existing_session, only: :new

  def new
    create_quiz_session_for_interview
    redirect_to_quiz_session
  end

  private

  def ensure_token_matches
    @invitation = Invitation.find params[:invitation_id]
    unless @invitation.token == params[:token]
      redirect_to root_path, flash: { error: I18n.t('error.access_violation') }
    end
  end

  def use_existing_session
    if @quiz_session = @invitation.quiz_sessions.recent.first
      redirect_to_quiz_session
    end
  end

  def create_quiz_session_for_interview
    @quiz_session = @invitation.quiz_sessions.create!
  end

  def redirect_to_quiz_session
    redirect_to quiz_session_path @quiz_session
  end

end

class QuizSessionsController < ApplicationController

  before_action :load_invitation, only: :new
  before_action :load_quiz_session, only: :show
  before_action :ensure_token_matches
  before_action :use_existing_session, only: :new

  def new
    create_quiz_session_for_interview
    redirect_to_quiz_session
  end

  private

  def ensure_token_matches
    unless @invitation.token == params[:token]
      handle_access_violation
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
    redirect_to quiz_session_path(@quiz_session, token: params[:token])
  end

  def load_quiz_session
    @quiz_session = QuizSession.find params[:id]
    @invitation = @quiz_session.invitation
    @applicant = @quiz_session.interviewee
  end

  def load_invitation
    @invitation = Invitation.find params[:invitation_id]
  end

end

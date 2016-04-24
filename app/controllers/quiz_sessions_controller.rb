class QuizSessionsController < ApplicationController

  before_action :ensure_admin_user, only: :update
  before_action :load_invitation, only: :new
  before_action :load_quiz_session, only: [:show, :update]
  before_action :persist_session_in_cookies, only: :show
  before_action :ensure_token_matches, only: :show
  before_action :use_existing_session, only: :new

  def new
    create_quiz_session_for_interview
    redirect_to_quiz_session first_visit: true
  end

  def show
    @show_welcome_popup = params[:first_visit]
    if next_question = @quiz_session.next_question
      @current_question = next_question.decorate
      @current_answer = @current_question.answers.build(quiz_session_id: @quiz_session.id)
    end
  end

  def update
    if (params[:quiz_session][:meta][:end] rescue false) == 'now'
      @quiz_session.ended_at = DateTime.now
    end
    @quiz_session.save!
    head :ok
  end

  private

  def ensure_token_matches
    unless @invitation.token == params[:token]
      handle_access_violation
    end
  end

  def use_existing_session
    if @quiz_session = @invitation.quiz_session
      redirect_to_quiz_session
    end
  end

  def create_quiz_session_for_interview
    @quiz_session = @invitation.create_quiz_session!
  end

  def redirect_to_quiz_session(options={})
    redirect_to quiz_session_path(@quiz_session, options.merge(token: params[:token]))
  end

  def load_quiz_session
    @quiz_session = QuizSession.find(params[:id])
    @invitation = @quiz_session.invitation
    @applicant = @quiz_session.interviewee
  end

  def persist_session_in_cookies
    cookies.signed[:quiz_session_id] = @quiz_session.id
  end

  def load_invitation
    @invitation = Invitation.find params[:invitation_id]
  end

end

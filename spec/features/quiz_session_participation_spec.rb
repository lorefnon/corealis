require 'rails_helper'

feature 'Quiz Session participation' do

  before(:each) do
    clear_emails
    @invitation = build(:invitation, quiz: create(:quiz, :having_many_questions))
    @invitation.notification_dispatch_skipped = false
    @invitation.save!
    open_email(@invitation.invitee.email)
  end

  scenario 'User visits quiz session from invitation email' do
    current_email.click_link 'Take the quiz'
    expect(@invitation.quiz_sessions.count).to eq 1
    @quiz_session = @invitation.quiz_sessions.first
    expect(current_path).to eq quiz_session_path(@quiz_session.id)
    question = @quiz_session.quiz.questions.first
    description_container = page.find('.question-container .section-description')
    expect(description_container.text).to include question.title
    expect(description_container.text).to include question.description
    expect(page.find('.submitted-question-list')).to have_selector '.zilch-container'
  end

  scenario 'User revisits quiz session from invitation email' do
  end

  scenario 'User answers questions' do
  end

  scenario 'User completes interview' do
  end

  scenario 'User revisits previous question' do
  end

end

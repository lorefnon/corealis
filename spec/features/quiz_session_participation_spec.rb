require 'rails_helper'
require 'support/finders/toast_message'

@javascript
feature 'Quiz Session participation' do

  before(:each) do
    Capybara.current_driver = :webkit
  end

  before(:each) do
    clear_emails
    @invitation = build(:invitation, quiz: create(:quiz, :having_many_questions))
    @invitation.notification_dispatch_skipped = false
    @invitation.save!
    open_email(@invitation.invitee.email)
  end

  scenario 'User visits quiz session from invitation email' do
    current_email.click_link 'Take the quiz'
    expect(page).to have_content 'Current Question'
    expect(@invitation.quiz_sessions.count).to eq 1
    @quiz_session = @invitation.quiz_sessions.first
    expect(current_path).to eq quiz_session_path(@quiz_session.id)
    question = @quiz_session.quiz.questions.first
    description_container = page.find('.question-container .section-description')
    expect(description_container.text).to include question.title
    expect(description_container.text).to include question.description
    # TODO FIXME
    expect(page.find('.submitted-question-list')).to have_selector '.zilch-container'
    expect(page.find('.progress-status')).to have_content "You have attempted 0 of #{@quiz_session.questions.count} questions"
  end

  scenario 'User revisits quiz session from invitation email' do
    current_email.click_link 'Take the quiz'
    current_email.click_link 'Take the quiz'
    expect(@invitation.quiz_sessions.count).to eq 1
  end

  scenario 'User answers questions' do
    current_email.click_link 'Take the quiz'
    @quiz_session = @invitation.quiz_sessions.first
    expect(page).to have_selector '.answer-details-container trix-editor'
    editor = page.find('.answer-details-container trix-editor')
    question = @quiz_session.questions.first
    answer = build(:answer, question: question)
    editor.set(answer.details)
    click_on 'Submit'
    expect(page).to have_selector :toast_message, 'Question submitted successfully'
    expect(@quiz_session.answers.count).to eq 1
    expect(page).to have_selector '.submitted-que-list-entry'
    expect(page.find('.progress-status')).to have_content "You have attempted 1 of #{@quiz_session.questions.count} questions"
  end

  scenario 'User completes interview' do
    current_email.click_link 'Take the quiz'
    @quiz_session = @invitation.quiz_sessions.first
    @quiz_session.questions.count.times do
      editor = page.find('.answer-details-container trix-editor')
      answer = build(:answer)
      editor.set(answer.details)
      click_on 'Submit'
    end
    expect(page).to have_content 'All Done'
    expect(page).to have_content 'Thank you for participating in this quiz session. We will get back to you shortly.'
  end

  scenario 'User revisits previous question' do
  end

end

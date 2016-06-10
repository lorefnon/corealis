require 'rails_helper'
require 'support/finders/toast_message'
require 'support/finders/quiz_session'
require 'support/features/quiz_session_helpers'
require 'support/matchers/quiz_session'

@javascript
feature 'Quiz Session participation' do

  include Features::QuizSessionHelpers

  before(:each) do
    Capybara.current_driver = :webkit
  end

  before(:each) do
    clear_emails
    @invitation = build :invitation, quiz: create(:quiz, :having_many_questions)
    @invitation.notification_dispatch_skipped = false
    @invitation.save!
    open_email @invitation.invitee.email
  end

  scenario 'User visits quiz session from invitation email' do
    current_email.click_link 'Take the quiz'
    expect(page).to have_content 'Current Question'
    @quiz_session = @invitation.quiz_session
    expect(@quiz_session).to be_present
    expect(current_path).to eq quiz_session_path(@quiz_session.id)
    question = @quiz_session.quiz.questions.first
    description_container = page.find('.question-container .section-description')
    expect(description_container.text).to include question.title
    expect(description_container.text).to include question.description
    expect(page.find('.submitted-question-list')).to have_selector '.zilch-container'
    expect(page).to have_quiz_session_progress current: 0, total: @quiz_session.questions.count
  end

  scenario 'User revisits quiz session from invitation email' do
    current_email.click_link 'Take the quiz'
    current_email.click_link 'Take the quiz'
    expect(@invitation.quiz_session).to be_present
  end

  scenario 'User answers questions' do
    current_email.click_link 'Take the quiz'
    @quiz_session = @invitation.quiz_session
    expect { answer_editor }.to_not raise_error
    question = @quiz_session.questions.first
    submit_answer_to_presented_question
    expect(page).to have_selector :toast_message, 'Question submitted successfully'
    expect(@quiz_session.answers.count).to eq 1
    expect(page).to have_quiz_session_progress current: 1, total: @quiz_session.questions.count
  end

  scenario 'User completes interview' do
    current_email.click_link 'Take the quiz'
    @quiz_session = @invitation.quiz_session
    expect(@quiz_session).to be_present
    @quiz_session.questions.count.times do
      submit_answer_to_presented_question
    end
    expect(page).to have_content 'All Done'
    expect(page).to have_content 'Thank you for participating in this quiz session. We will get back to you shortly.'
  end

  scenario 'User revisits previous question' do
    current_email.click_link 'Take the quiz'
    @quiz_session = @invitation.quiz_session
    submit_answer_to_presented_question
    expect(page).to have_selector :toast_message, 'Question submitted successfully'
    question = @quiz_session.submitted_questions.first
    answer = @quiz_session.answers.first
    page.find(:link_to_previous_answer, question).click
    expect(page).to have_selector ".question-container[data-question-id='#{question.id}']"
    expect(presented_question_title).to include question.title
    expect(presented_question_description).to include question.description
    expect(presented_answer_description).to include answer.details
  end

end

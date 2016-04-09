require 'rails_helper'
require 'support/features/admin/session_helpers'
require 'support/features/admin/quiz_helpers'
require 'support/matchers/have_flash_message'
require 'support/matchers/active_admin'
require 'support/finders/active_admin'
require 'support/features/route_helpers'
require 'support/matchers/route'

feature 'Quiz management' do

  include Features::Admin::SessionHelpers
  include Features::Admin::QuizHelpers
  include Features::RouteHelpers

  before(:each) do
    ensure_admin_signed_in
  end

  scenario 'Admin user creates quiz' do
    visit admin_quizzes_path
    click_on 'New Quiz'
    quiz = fill_quiz_details quiz
    click_on 'Create Quiz'
    expect(current_route).to match_action 'admin/quizzes#show'
    expect(page).to have_flash_message('Quiz was successfully created.')
    expect(page).to have_selector :panel, 'Quiz Details'
    attributes_table = page.find(:attributes_table, 'Quiz')
    expect(attributes_table).to have_attributes quiz.attributes.slice(:title, :duration)
  end

  scenario 'Admin user adds question to quiz' do
    quiz = create :quiz
    visit admin_quiz_path(quiz)
    click_on 'Add Question'
    expect(current_url).to eq new_admin_question_url(quiz_id: quiz.id)
    question = fill_question_details
    click_on 'Create Question'
    expect(current_route).to match_action 'admin/questions#show'
    question.id = current_route[:id]
    question_attributes = question.attributes.slice(:title, :description)
    question_attributes_table = page.find(:attributes_table, 'Question')
    expect(question_attributes_table).to have_attributes question_attributes
    visit admin_quiz_path(quiz)
    expect { quiz_question_row question }.to_not raise_error
  end

  scenario 'Admin user removes question from quiz' do
    quiz = create :quiz
    question = create :question
    quiz.quiz_question_associators.create!(question: question, associator: @admin)
    visit admin_quiz_path(quiz)
    quiz_question_row_checkbox(question).set true
    click_on 'Remove Selected'
    expect(current_url).to eq admin_quiz_url(quiz)
    expect(page).to have_flash_message('Selected questions have been removed from quiz')
  end

end

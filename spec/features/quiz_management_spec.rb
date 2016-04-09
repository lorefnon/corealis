require 'rails_helper'
require 'support/features/admin_session_helpers'
require 'support/features/quiz_helpers'
require 'support/matchers/have_flash_message'
require 'support/matchers/active_admin'
require 'support/finders/active_admin'
require 'support/features/route_helpers'

feature 'Quiz management' do

  include Features::AdminSessionHelpers
  include Features::QuizHelpers
  include Features::RouteHelpers

  before(:each) do
    ensure_admin_signed_in
  end

  scenario 'Admin user creates quiz' do
    visit admin_quizzes_path
    click_on 'New Quiz'
    quiz = fill_quiz_details quiz
    click_on 'Create Quiz'
    r = current_route
    expect(r[:controller]).to eq "admin/quizzes"
    expect(r[:action]).to eq "show"
    expect(page).to have_flash_message('Quiz was successfully created.')
    expect(page.find :panel, 'Quiz Details').to be_present
    attributes_table = page.find(:attributes_table, 'Quiz')
    expect(r[:id]).to eq attributes_table.find(:attribute_value, :id).text
    expect(quiz.title).to eq attributes_table.find(:attribute_value, :title).text
    expect(quiz.duration.to_s).to eq attributes_table.find(:attribute_value, :duration).text
  end

  scenario 'Admin user adds question to quiz' do
    quiz = create :quiz
    visit admin_quiz_path(quiz)
    click_on 'Add Question'
    expect(current_url).to eq new_admin_question_url(quiz_id: quiz.id)
    question = fill_question_details
    click_on 'Create Question'
    r = current_route
    expect(r[:controller]).to eq 'admin/questions'
    expect(r[:action]).to eq 'show'
    attributes_table = page.find(:attributes_table, 'Question')
    expect(r[:id]).to eq attributes_table.find(:attribute_value, :id).text
    expect(question.title).to eq attributes_table.find(:attribute_value, :title).text
    expect(question.description).to eq attributes_table.find(:attribute_value, :description).text
    visit admin_quiz_path(quiz)
    expect do
      questions_panel = page.find(:panel, 'Questions')
    end.to_not raise_error
    expect do
      questions_panel.find(:xpath, './/td[contains(@class, "col-id")][.="#{quiz.id}"]')
    end.to_not raise_error
  end
end

require 'rails_helper'
require 'support/features/admin_session_helpers'
require 'support/features/quiz_helpers'
require 'support/matchers/have_flash_message'
require 'support/matchers/active_admin'
require 'support/finders/active_admin'

feature 'Quiz management' do

  include Features::AdminSessionHelpers
  include Features::QuizHelpers

  before(:each) do
    ensure_admin_signed_in
    visit admin_quizzes_path
  end

  scenario 'Admin user creates quiz and adds questions' do
    click_on 'New Quiz'
    quiz = build(:quiz)
    fill_quiz_details quiz
    click_on 'Create Quiz'
    r = Rails.application.routes.recognize_path(current_path)
    expect(r[:controller]).to eq "admin/quizzes"
    expect(r[:action]).to eq "show"
    expect(page).to have_flash_message('Quiz was successfully created.')
    expect(page.find :panel, 'Quiz Details').to be_present
    attributes_table = page.find(:attributes_table, 'Quiz')
    expect(r[:id]).to eq attributes_table.find(:attribute_value, :id).text
    expect(quiz.title).to eq attributes_table.find(:attribute_value, :title).text
    expect(quiz.duration.to_s).to eq attributes_table.find(:attribute_value, :duration).text
  end


end

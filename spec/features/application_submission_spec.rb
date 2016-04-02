require 'rails_helper'
require 'support/features/opening_helpers'
require 'support/features/application_submission_helpers'

feature 'Application Submission' do

  include Features::OpeningHelpers
  include Features::ApplicationSubmissionHelpers

  before(:each) do
    @opening = create(:opening, :showcased)
  end

  context 'User has not already applied for the position' do

    before(:each) do
      @submission = build(:application_submission, opening: @opening)
      @applicant = @submission.applicant
    end

    scenario 'Applying from Home Page' do
      visit_opening_from_home_page @opening
      submit_application @submission
      expect_submission_success
    end

    scenario 'Applying for opening from careers page' do
      visit_opening_from_careers_page @opening
      submit_application @submission
      expect_submission_success
    end
  end

  context 'User has already applied for position' do

    before(:each) do
      @submission = create(:application_submission, opening: @opening)
      @applicant = @submission.applicant
    end

    scenario 'Applying from Home Page' do
      visit_opening_from_home_page @opening
      submit_application @submission
      expect_duplicate_submission_error
    end

    scenario 'Applying for opening from careers page' do
      visit_opening_from_careers_page @opening
      submit_application @submission
      expect_duplicate_submission_error
    end

  end
end

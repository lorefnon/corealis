require 'rails_helper'
require 'support/features/opening_helpers'
require 'support/features/application_submission_helpers'

feature 'Application Submission' do

  include Features::OpeningHelpers
  include Features::ApplicationSubmissionHelpers

  context 'User has not already applied for the position' do
    scenario 'Applying from Home Page' do
      opening = create(:opening, :showcased)
      visit_opening_from_home_page opening
      application_submission = build(:application_submission, opening: opening)
      applicant = application_submission.applicant
      fill_applicant_details applicant
      fill_submission_details application_submission
      click_on 'Create Application submission'
      expect_submission_success
    end
  end

  context 'User has already applied for position' do
    scenario 'Applying from Home Page' do
      opening = create(:opening, :showcased)
      visit_opening_from_home_page opening
      application_submission = create(:application_submission, opening: opening)
      applicant = application_submission.applicant
      fill_applicant_details applicant
      fill_submission_details application_submission
      click_on 'Create Application submission'
      expect_duplicate_submission_error
    end
  end

  scenario 'Applying for opening from careers page' do
  end

end

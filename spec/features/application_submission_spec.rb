require 'rails_helper'
require 'support/features/opening_helpers'
require 'support/features/application_submission_helpers'

feature 'application submission for opening' do

  include Features::OpeningHelpers
  include Features::ApplicationSubmissionHelpers

  scenario 'Applying for opening from home page' do
    opening = create(:opening, :showcased)
    visit_opening_from_home_page opening
    applicant = build(:applicant)
    application_submission = build(
      :application_submission,
      applicant: applicant,
      opening: opening
    )
    fill_applicant_details applicant
    fill_submission_details application_submission
    click_on 'Create Application submission'
    expect(current_path).to eq application_submission_verdict_path(verdict: 'success')
    expect(page).to have_content "Congratulations !"
    expect(page).to have_content "Your application was successfully submitted"
  end

  scenario 'Applying for opening from careers page' do
  end

end

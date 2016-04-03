require 'rails_helper'
require 'support/features/admin_session_helpers'
require 'support/features/opening_helpers'
require 'support/features/admin/opening_helpers'
require 'support/matchers/have_opening_listed'
require 'support/matchers/have_flash_message'

feature 'Opening Management' do

  include Features::AdminSessionHelpers
  include Features::OpeningHelpers
  include Features::Admin::OpeningHelpers

  before(:each) do
    ensure_admin_signed_in
    visit admin_openings_path
  end

  context 'New Opening' do

    before(:each) do
      click_on 'New Opening'
      expect(current_path).to eq new_admin_opening_path
    end

    scenario 'created' do
      opening = build(:opening)
      submit_opening opening
      expect(page).to have_flash_message('Opening was successfully created.')
      opening = shown_opening
      visit root_path
      expect(page).to_not have_opening_listed opening
      visit openings_path
      expect(page).to have_opening_listed opening
    end

    scenario 'created as showcased' do
      opening = build :opening, :showcased
      submit_opening opening
      expect(page).to have_flash_message('Opening was successfully created.')
      opening = shown_opening
      visit root_path
      expect(page).to have_opening_listed opening
      visit openings_path
      expect(page).to have_opening_listed opening
    end

    scenario 'created as expired' do
      submit_opening build :opening, :expired
      expect(page).to have_flash_message('Opening was successfully created.')
      opening = shown_opening
      visit root_path
      expect(page).to_not have_opening_listed opening
      visit openings_path
      expect(page).to_not have_opening_listed opening
    end
  end

  context 'Current Opening' do
    scenario 'Updated to be showcased' do
      opening = create :opening
      visit opening_path(opening)
    end

    scenario 'Updated to be unshowcased' do
    end

    scenario 'Updated to be expired' do
    end
  end

  context 'Expired Opening' do
    scenario 'Reopened' do
    end

    scenario 'Reopened to be showcased' do
    end
  end

end

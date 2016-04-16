require 'rails_helper'
require 'support/features/admin/session_helpers'

feature 'Admin Home Page' do

  include Features::Admin::SessionHelpers

  before(:each) do
    ensure_admin_signed_in
  end

  scenario 'Visited' do
    visit admin_root_url
    expect(page).to have_content 'Active Invitations'
    expect(page).to have_content 'Recent Quiz Sessions'
  end
end

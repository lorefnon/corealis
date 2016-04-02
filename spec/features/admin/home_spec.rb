require 'rails_helper'
require 'support/features/admin_session_helpers'

feature 'Admin Home Page' do

  include Features::AdminSessionHelpers

  before(:each) do
    ensure_admin_signed_in
  end

  scenario 'Visited' do
    visit admin_root_path
    expect(page).to have_content 'Active Invitations'
    expect(page).to have_content 'Recent Quiz Sessions'
  end
end

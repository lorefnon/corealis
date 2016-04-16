require 'rails_helper'
require 'support/matchers/have_flash_message'
require 'support/features/admin/session_helpers'

feature 'Admin Login page' do

  include Features::Admin::SessionHelpers

  scenario 'contains a login form' do
    visit new_admin_user_session_url
    form = find 'form#session_new.admin_user'
    expect(form).to_not be_nil
    expect(form).to have_field :admin_user_email
    expect(form).to have_field :admin_user_password
  end

  scenario 'Allows admin user to login' do
    user = create :admin_user
    sign_in user.email, "password"
    expect(page).to have_current_path admin_root_path
    expect(page).to have_flash_message 'Signed in successfully.'
  end

  scenario 'Prevents non existent users from loggin in' do
    sign_in "nonexistent@example.com", "password"
    expect(page).to have_current_path new_admin_user_session_path
    expect(page).to have_content "Invalid email or password"
  end

end

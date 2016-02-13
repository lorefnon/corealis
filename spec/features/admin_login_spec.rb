require 'rails_helper'

RSpec.feature "Admin Sign In" do

  scenario 'with valid email and password' do
    sign_in
    expect(page).to have_current_path(admin_root_path)
  end

end

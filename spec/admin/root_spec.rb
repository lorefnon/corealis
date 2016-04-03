require 'rails_helper'
require 'support/features/admin_session_helpers'

feature 'Root' do

  include Features::AdminSessionHelpers

  before(:each) do
    ensure_admin_signed_in
    visit admin_root_path
  end

  subject { page }

  it { is_expected.to have_link 'Logout', destroy_admin_user_session_path }

  context 'Navbar' do
    subject { page.find '#header #tabs' }

    {
      "Dashboard" => 'dashboard',
      "Quizzes" => 'quizzes',
      "Questions" => 'questions',
      "Applicants" => 'applicants',
      "Invitations" => 'invitations',
      "Admin Users" => 'admin_users',
      "Application Submissions" => 'application_submissions',
      "Archives" => 'paper_trail_versions',
      "Openings" => 'openings'
    }.each do |label, path|
      it { is_expected.to have_link label, href: send("admin_#{path}_path") }
    end

  end

end

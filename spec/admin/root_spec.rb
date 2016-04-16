require 'rails_helper'
require 'support/features/admin/session_helpers'
require 'support/finders/active_admin'

feature 'Root' do

  include Features::Admin::SessionHelpers

  before(:each) do
    ensure_admin_signed_in
    visit admin_root_url
  end

  subject { page }

  it { is_expected.to have_link 'Logout', href: destroy_admin_user_session_path }

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

  context 'Panels' do
    context "Active Invitations" do
      subject { find(:panel, "Active Invitations") }
      it { is_expected.to be_present }
      # TODO Check contents of panel
    end
    context "Recent Quiz Sessions" do
      subject { find(:panel, "Recent Quiz Sessions") }
      it { is_expected.to be_present }
      # TODO check contents of panel
    end
  end

end

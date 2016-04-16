require 'rails_helper'
require 'support/features/admin/session_helpers'
require 'support/finders/active_admin'
require 'support/matchers/active_admin'

feature 'Quiz' do

  include Features::Admin::SessionHelpers

  before(:each) do
    @quiz = create(:quiz)
    ensure_admin_signed_in
    visit admin_quizzes_url
  end

  context "Index table" do
    subject { page.find :index_table, :quiz }
    %i[id title duration slug created_at updated_at].each do |col|
      it { is_expected.to have_index_column col }
    end
  end

end

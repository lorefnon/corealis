require 'rails_helper'

RSpec.describe ApplicationSubmission, type: :model do
  it { is_expected.to belong_to :applicant }
  it { is_expected.to belong_to :opening }
  it { is_expected.to validate_presence_of :applicant }
  # TODO Add additional specs
end

# == Schema Information
#
# Table name: application_submissions
#
#  id           :integer          not null, primary key
#  applicant_id :integer          not null
#  opening_id   :integer
#  cover_letter :text
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
# Indexes
#
#  index_application_submissions_on_applicant_id_and_opening_id  (applicant_id,opening_id) UNIQUE
#

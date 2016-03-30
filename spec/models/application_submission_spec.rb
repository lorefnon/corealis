require 'rails_helper'

RSpec.describe ApplicationSubmission, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
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

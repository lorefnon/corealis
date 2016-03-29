FactoryGirl.define do
  factory :application_submission do
    applicant_id 1
    opening_id 1
    cover_letter ""
  end
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

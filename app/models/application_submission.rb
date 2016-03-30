class ApplicationSubmission < ApplicationRecord

  has_paper_trail

  belongs_to :applicant
  belongs_to :opening

  accepts_nested_attributes_for :applicant

  validates :applicant_id, presence: true
  validates :applicant, presence: true, on: :create

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

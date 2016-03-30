class ApplicationSubmission < ApplicationRecord

  has_paper_trail

  belongs_to :applicant
  belongs_to :opening

  accepts_nested_attributes_for :applicant

  validates :applicant_id, presence: true
  validates :applicant, presence: true, on: :create

  def save_or_populate_applicant
    return false unless applicant
    applicant.save!
  rescue ActiveRecord::RecordNotUnique
    self.applicant = Applicant.where(email: applicant.email).first
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
# Indexes
#
#  index_application_submissions_on_applicant_id_and_opening_id  (applicant_id,opening_id) UNIQUE
#

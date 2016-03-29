class ApplicationSubmission < ActiveRecord::Base

  belongs_to :applicant
  belongs_to :opening

  validates :applicant_id, presence: true
  validates :applicant, presence: true, on: :create

end

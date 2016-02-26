class Invitation < ApplicationRecord

  has_paper_trail

  belongs_to :quiz
  belongs_to :invitor, class_name: 'AdminUser'
  belongs_to :invitee, class_name: 'Applicant'

  scope :active, -> { where 'valid_from <= :now AND valid_till >= :now', now: Time.zone.now }

  enum status: [:pending, :accepted, :declined]

  after_create :dispatch_notification

  private

  def dispatch_notification
    InvitiationMailer.invitation_mail(self).deliver
  end

end

# == Schema Information
#
# Table name: invitations
#
#  id         :integer          not null, primary key
#  invitor_id :integer          not null
#  invitee_id :integer          not null
#  quiz_id    :integer          not null
#  status     :integer          default(0)
#  valid_from :datetime
#  valid_till :datetime
#  duration   :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_invitations_on_id_and_status                     (id,status)
#  index_invitations_on_id_and_valid_from_and_valid_till  (id,valid_from,valid_till)
#  index_invitations_on_quiz_id                           (quiz_id)
#

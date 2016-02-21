class Invitation < ActiveRecord::Base

  has_paper_trail

  belongs_to :quiz
  belongs_to :invitor, class_name: 'AdminUser'
  belongs_to :invitee, class_name: 'Applicant'

  scope :active, -> { where 'valid_from <= :now AND valid_till >= :now', now: Time.zone.now }

  after_create :send_invitation_mail

  private

  def send_invitation_mail
  end

end

# == Schema Information
#
# Table name: invitations
#
#  id         :integer          not null, primary key
#  invitor_id :integer
#  invitee_id :integer
#  quiz_id    :integer
#  valid_from :datetime
#  valid_till :datetime
#  duration   :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

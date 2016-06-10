class Invitation < ApplicationRecord

  has_paper_trail

  belongs_to :quiz
  belongs_to :invitor, class_name: 'AdminUser'
  belongs_to :invitee, class_name: 'Applicant'
  has_one :quiz_session, dependent: :destroy
  has_many :invitation_time_slot_associators, dependent: :destroy
  has_many :time_slots,
    through: :invitation_time_slot_associators,
    dependent: :destroy

  attr_accessor :notification_dispatch_skipped

  after_initialize :set_defaults

  accepts_nested_attributes_for :invitee

  scope :active, -> { where 'valid_from <= :now AND valid_till >= :now', now: Time.zone.now }

  enum status: [:pending, :accepted, :declined]

  before_validation :assign_token
  after_create :dispatch_notification, unless: :notification_dispatch_skipped

  validates :invitor_id,
            :invitee_id,
            :quiz_id,
            :status,
            presence: true

  def dispatch_notification
    InvitationMailer.invitation_mail(self).deliver_now
  end

  private

  def assign_token
    self.token = SecureRandom.urlsafe_base64
  end

  def set_defaults
    self.duration ||= 45.minutes
    self.valid_till ||= (Date.today + 3.days).end_of_day
    self.valid_from ||= DateTime.now
    self.status ||= :pending
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
#  status     :integer          default("pending")
#  valid_from :datetime
#  valid_till :datetime
#  duration   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  token      :string
#
# Indexes
#
#  index_invitations_on_id_and_status                     (id,status)
#  index_invitations_on_id_and_valid_from_and_valid_till  (id,valid_from,valid_till)
#  index_invitations_on_quiz_id                           (quiz_id)
#

class TimeSlot < ActiveRecord::Base

  has_many :invitation_time_slot_associators
  has_many :invitations, through: :invitation_time_slot_associators

  scope :starts_after, -> (ts) { where 'starts_at => ?', ts }
  scope :starts_before, -> (ts) { where 'starts_at <= ?', ts }
  scope :ends_before, -> (ts) { where 'ends_at <= ?', ts }
  scope :ends_after, -> (ts) { where 'ends_at >= ?', ts }
  scope :active, -> { starts_before(DateTime.now).ends_after(DateTime.now) }

end

# == Schema Information
#
# Table name: time_slots
#
#  id         :integer          not null, primary key
#  starts_at  :datetime         not null
#  ends_at    :datetime         not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

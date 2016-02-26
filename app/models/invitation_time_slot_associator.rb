class InvitationTimeSlotAssociator < ActiveRecord::Base
  belongs_to :invitation
  belongs_to :time_slot
  belongs_to :proposer, polymorphic: true
  enum confirmation_status: [:accepted, :declined, :pending]
end

# == Schema Information
#
# Table name: invitation_time_slot_associators
#
#  id                  :integer          not null, primary key
#  confirmation_status :integer
#  invitation_id       :integer          not null
#  proposer_id         :integer          not null
#  proposer_type       :string           not null
#  time_slot_id        :integer          not null
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#

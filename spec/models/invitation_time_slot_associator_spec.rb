require 'rails_helper'

RSpec.describe InvitationTimeSlotAssociator, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
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

require 'rails_helper'

RSpec.describe TimeSlot, type: :model do
  it { is_expected.to have_many :invitation_time_slot_associators }
  it { is_expected.to have_many :invitations }
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

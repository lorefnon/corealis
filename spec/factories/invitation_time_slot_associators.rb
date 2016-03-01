FactoryGirl.define do
  factory :invitation_time_slot_associator do
    
  end
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

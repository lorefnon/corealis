FactoryGirl.define do
  factory :time_slot do
    starts_at "2016-02-27 00:23:48"
    ends_at "2016-02-27 00:23:48"
    confirmation_status 1
  end
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

class TimeSlot < ActiveRecord::Base

  enum :confirmation_status

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

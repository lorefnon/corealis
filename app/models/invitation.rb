class Invitation < ActiveRecord::Base
end

# == Schema Information
#
# Table name: invitations
#
#  id         :integer          not null, primary key
#  invitor_id :integer
#  invitee_id :integer
#  quiz_id    :integer
#  starts_at  :datetime
#  ends_at    :datetime
#  duration   :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Invitation < ActiveRecord::Base

  belongs_to :invitor, class_name: 'AdminUser'
  belongs_to :invitee, class_name: 'User'

  scope :upcoming, -> { where starts_at: (DateTime.now..(DateTime.now+1.week)) }

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

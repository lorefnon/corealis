FactoryGirl.define do
  factory :invitation do
    invitor
    invitee
    quiz

    Invitation.statuses.each {|i| trait(i) { status i } }

    before(:create) do |invitation|
      invitation.notification_dispatch_skipped
    end

    trait :scheduled_for_future do
      valid_from DateTime.now + 1.day
      valid_till DateTime.now + 2.day
    end

    trait :expired do
      valid_from DateTime.now - 2.day
      valid_till DateTime.now - 1.day
    end

    trait :current do
      valid_from DateTime.now - 1.day
      valid_till DateTime.now + 1.day
    end

    trait :long_spanning do
      valid_from DateTime.now - 1.year
      valid_till DateTime.now + 1.year
    end

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
#  status     :integer          default(0)
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

FactoryGirl.define do
  factory :applicant, aliases: [:interviewee, :invitee] do
    creator
    sequence(:name) {|i| "applicant#{i}"}
    email { "#{name}@corealis.in" }
  end
end

# == Schema Information
#
# Table name: applicants
#
#  id                  :integer          not null, primary key
#  creator_id          :integer
#  name                :string
#  email               :string
#  phone_number        :string
#  quiz_sessions_count :integer
#  experience          :decimal(, )
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#
# Indexes
#
#  index_applicants_on_creator_id    (creator_id)
#  index_applicants_on_email         (email) UNIQUE
#  index_applicants_on_experience    (experience)
#  index_applicants_on_phone_number  (phone_number)
#

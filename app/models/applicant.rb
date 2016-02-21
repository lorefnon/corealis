class Applicant < ActiveRecord::Base
  has_many :online_resource_applicant_associators
  has_many :online_resources, through: :online_resource_applicant_associators
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

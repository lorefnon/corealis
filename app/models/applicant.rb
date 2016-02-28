class Applicant < ApplicationRecord

  has_many :online_resource_applicant_associators
  has_many :online_resources, through: :online_resource_applicant_associators

  belongs_to :creator, class_name: 'AdminUser'

  validates :creator, presence: true, on: :create
  validates :creator_id, presence: true
  validates :name, presence: true

  slugify :name, slug_attribute: 'username'

end

# == Schema Information
#
# Table name: applicants
#
#  id                  :integer          not null, primary key
#  creator_id          :integer
#  name                :string
#  username            :string
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
#  index_applicants_on_username      (username) UNIQUE
#

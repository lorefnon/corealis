require 'rails_helper'

RSpec.describe Applicant, type: :model do
  it { is_expected.to have_many :online_resource_applicant_associators }
  it { is_expected.to have_many :online_resources }
  it { is_expected.to have_many :application_submissions }
  it { is_expected.to have_many :applied_openings }
  it { is_expected.to belong_to :creator }
  it { is_expected.to validate_presence_of :name }
  it { is_expected.to validate_presence_of :email }
end

# == Schema Information
#
# Table name: applicants
#
#  id                  :integer          not null, primary key
#  creator_id          :integer
#  name                :string           not null
#  email               :string           not null
#  phone_number        :string
#  quiz_sessions_count :integer          default(0), not null
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

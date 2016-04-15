require 'rails_helper'

RSpec.describe OnlineResourceApplicantAssociator, type: :model do
  it { is_expected.to belong_to :online_resource }
  it { is_expected.to belong_to :applicant }
  it { is_expected.to have_one :provider }
  it { is_expected.to validate_presence_of :online_resource_id }
  it { is_expected.to validate_presence_of :applicant_id }
end

# == Schema Information
#
# Table name: online_resource_applicant_associators
#
#  id                 :integer          not null, primary key
#  online_resource_id :integer          not null
#  applicant_id       :integer          not null
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#
# Indexes
#
#  index_oraa_a_id_o_r_id  (applicant_id,online_resource_id)
#

require 'rails_helper'

RSpec.describe OnlineResourceApplicantAssociator, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
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

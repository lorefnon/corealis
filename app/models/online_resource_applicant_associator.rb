class OnlineResourceApplicantAssociator < ActiveRecord::Base
  belongs_to :online_resource
  belongs_to :provider, through: :online_resource
  belongs_to :applicant
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

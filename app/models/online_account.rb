class OnlineAccount < ActiveRecord::Base
  belongs_to :applicant
  belongs_to :provider, class_name: 'OnlineAccountProvider'
end

# == Schema Information
#
# Table name: online_accounts
#
#  id           :integer          not null, primary key
#  applicant_id :integer          not null
#  url          :string           not null
#  provider_id  :integer          not null
#  identity     :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

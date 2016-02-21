class OnlineAccountProvider < ActiveRecord::Base
  validates :root_url, :label, :name, presence: true
end

# == Schema Information
#
# Table name: online_account_providers
#
#  id         :integer          not null, primary key
#  root_url   :string           not null
#  label      :string           not null
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

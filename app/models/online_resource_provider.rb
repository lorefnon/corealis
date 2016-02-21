class OnlineResourceProvider < ActiveRecord::Base
  validates :label, :name, presence: true
  has_many :online_resources
end

# == Schema Information
#
# Table name: online_resource_providers
#
#  id         :integer          not null, primary key
#  root_url   :string           not null
#  label      :string           not null
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

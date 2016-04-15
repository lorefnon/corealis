require 'rails_helper'

RSpec.describe OnlineResourceProvider, type: :model do
  it { is_expected.to validate_presence_of :name }
  it { is_expected.to have_many(:online_resources).dependent(:destroy) }
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
# Indexes
#
#  index_online_resource_providers_on_label  (label) UNIQUE
#

require 'rails_helper'

RSpec.describe OnlineResourceProvider, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
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

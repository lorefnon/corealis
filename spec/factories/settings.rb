FactoryGirl.define do
  factory :setting do
    sequence(:key) {|i| "key#{i}" }
    sequence(:value) {|i| "value#{i}" }
  end
end

# == Schema Information
#
# Table name: settings
#
#  id         :integer          not null, primary key
#  key        :string           not null
#  value      :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_settings_on_key  (key) UNIQUE
#

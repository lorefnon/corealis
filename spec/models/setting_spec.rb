require 'rails_helper'

RSpec.describe Setting, type: :model do

  context :convenience_getter do

    it 'provides direct access to setting value' do
      setting = create :setting
      expect(Setting[setting.key]).to eq(setting.value)
    end

  end

  context :convenience_setter do
    it 'provides direact means to update setting' do
      setting = create :setting
      test_val = "test-val"
      Setting[setting.key] = test_val
      setting.reload
      expect(setting.value).to eq test_val
      expect(Setting[setting.key]).to eq test_val
    end
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

require 'rails_helper'

RSpec.describe Setting, type: :model do

  context :convenience_getter do

    it 'provides direct access to setting value' do
      Setting.create!(key: 'test-key', value: 'test-value')
      expect(Setting['test-key']).to eq('test-value')
    end

  end

  context :convenience_setter do
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

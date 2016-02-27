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

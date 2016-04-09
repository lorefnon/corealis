require 'rails_helper'

RSpec.describe Opening, type: :model do
  context 'showcased' do
    it 'has to be current' do
      expect do
        create(:opening, showcased: true, current: false)
      end.to raise_error(ActiveRecord::RecordInvalid, /current must be true in order to be showcased/i)
    end
  end
end

# == Schema Information
#
# Table name: openings
#
#  id          :integer          not null, primary key
#  title       :string           not null
#  slug        :string           not null
#  description :string
#  current     :boolean          default(TRUE), not null
#  showcased   :boolean          default(FALSE), not null
#  creator_id  :integer          not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

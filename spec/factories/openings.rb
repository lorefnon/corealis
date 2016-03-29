FactoryGirl.define do
  factory :opening do
    
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

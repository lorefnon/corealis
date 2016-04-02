FactoryGirl.define do
  factory :opening do
    sequence(:title) {|i| "Position #{i}" }
    description "Lorem ipsum dolor sit amet"
    current true
    showcased false

    association :creator, factory: :admin_user

    trait(:showcased) { showcased true }
    trait(:expired) { current false }
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

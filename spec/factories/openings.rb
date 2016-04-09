FactoryGirl.define do
  factory :opening do

    sequence(:title) {|i| "Position #{i}" }
    description "Lorem ipsum dolor sit amet"
    current true
    showcased false

    association :creator, factory: :admin_user

    trait(:showcased) { showcased true }
    trait(:expired) { current false }

    factory :ruby_developer_opening, traits: [:showcased] do
      title "Senior Ruby Developer"
      description <<~DOC
      Are you a rockstar ruby developer with end to end expertise in delivering
      dynamic web applications within stringent timeframes in an agile environment ?
      You are exactly the kind of person we are looking for.
      DOC
    end

    factory :swift_developer_opening, traits: [:showcased] do
      title "Senior Swift Developer"
      description <<~DOC
      We are looking to hire a senior developer proficient in Swift, Cocoa,
      Cocos-2D capable of supervising the development of our app
      used by millions of users worldwide.
      DOC
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

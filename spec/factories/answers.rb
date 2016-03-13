FactoryGirl.define do
  factory :answer do

    question

    trait :answered_by_admin do
      association :answerer, factory: :admin_user
    end

    trait :answered_by_candidate do
      association :answerer, factory: :admin_user
    end

    factory :canonical, traits: [:answered_by_admin] do
      canonical true
    end

  end
end

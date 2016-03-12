FactoryGirl.define do
  factory :question do
    sequence(:title) {|i| "question#{i}" }
    sequence(:description) {|i| "description#{i}" }
    creator

    trait :having_answers do

      transient do
        answers_count 10
      end

      after(:create) do |question, evaluator|
        create_list :answer, evaluator.answers_count, question: question
      end
    end

  end
end

# == Schema Information
#
# Table name: questions
#
#  id          :integer          not null, primary key
#  title       :string           not null
#  description :text
#  creator_id  :integer          not null
#  slug        :string           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_questions_on_slug  (slug) UNIQUE
#

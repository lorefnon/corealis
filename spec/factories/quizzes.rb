FactoryGirl.define do
  factory :quiz do
    creator
    duration 3600
    sequence(:title) {|i| "quiz#{i}" }

    trait :having_many_questions do
      after(:create) do |quiz|
        quiz.associate_questions_through(
          associator: create(:admin_user),
          question_id: 10.times.map { create :question }.map(&:id)
        )
      end
    end

    trait :having_answers do
      after(:create) do |quiz|
        quiz.questions.each do |question|
          question.answers << create(:answer)
        end
      end
    end

  end
end

# == Schema Information
#
# Table name: quizzes
#
#  id         :integer          not null, primary key
#  title      :string           not null
#  creator_id :integer          not null
#  duration   :integer
#  slug       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_quizzes_on_creator_id_and_slug  (creator_id,slug)
#  index_quizzes_on_slug                 (slug) UNIQUE
#

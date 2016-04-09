FactoryGirl.define do
  factory :quiz do
    creator
    duration 3600
    sequence(:title) {|i| "quiz#{i}" }

    trait :having_many_questions do
      after(:create) do |quiz|
        quiz.associate_questions_through(
          associator: quiz.creator,
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

    factory :ruby_developer_quiz do
      after(:create) do |quiz|
        quiz.associate_questions_through(
          associator: quiz.creator,
          question_id: [
            create(:question,
              title: 'What is the difference between symbols and strings in ruby ?',
              description: <<~DOC
              Illustrate with some simple examples what is the difference between
              symbols and strings in ruby.

              Are symbols in ruby garbage collected ?
              DOC
            ).id,
            create(:question,
              title: 'What does Rails do to protect us against CSRF attacks ?',
              description: <<~DOC
              Briefly describe the threat posed by CSRF attacks and facilities
              available in Rails to protect the application against it.

              Bonus points for illustrating with a test suite how such an attach
              may be orchestrated in absence of CSRF protectin.
              DOC
            ).id,
            create(:question,
              title: 'What are polymorphic associations in Rails',
              description: <<~DOC
              Using an example explain what is a polymorphic association and how
              it can be useful.
              DOC
            ).id
          ]
        )
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

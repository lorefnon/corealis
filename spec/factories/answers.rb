FactoryGirl.define do
  factory :answer do

    question

    trait :answered_by_admin do
      association :answerer, factory: :admin_user
    end

    trait :answered_by_applicant do
      association :answerer, factory: :applicant
    end

    factory :canonical, traits: [:answered_by_admin] do
      canonical true
    end

  end
end

# == Schema Information
#
# Table name: answers
#
#  id              :integer          not null, primary key
#  question_id     :integer          not null
#  details         :text
#  answerer_id     :integer          not null
#  answerer_type   :string           not null
#  quiz_session_id :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  canonical       :boolean          default(FALSE), not null
#
# Indexes
#
#  index_answers_on_id_and_question_id_and_quiz_session_id         (id,question_id,quiz_session_id) UNIQUE
#  index_answers_on_question_id_and_answerer_id_and_answerer_type  (question_id,answerer_id,answerer_type)
#  index_answers_on_question_id_and_canonical                      (question_id,canonical)
#  index_answers_on_quiz_session_id_and_question_id                (quiz_session_id,question_id)
#

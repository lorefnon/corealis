class QuizQuestionAssociator < ApplicationRecord

  belongs_to :question
  belongs_to :quiz
  belongs_to :associator, class_name: 'AdminUser'

  validates :question_id,
            :quiz_id,
            :associator_id,
            presence: true

end

# == Schema Information
#
# Table name: quiz_question_associators
#
#  id            :integer          not null, primary key
#  question_id   :integer
#  quiz_id       :integer
#  associator_id :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
# Indexes
#
#  index_quiz_question_associators_on_quiz_id_and_question_id  (quiz_id,question_id)
#

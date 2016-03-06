class QuizQuestionAssociator < ApplicationRecord

  belongs_to :question
  belongs_to :quiz
  belongs_to :associator, class_name: 'AdminUser'

  validates :question_id,
            :quiz_id,
            :associator_id,
            presence: true

  validates :ordering,
            uniqueness: { scope: :quiz_id },
            presence: true

  before_validation :assign_ordering

  private

  def assign_ordering
    self.ordering ||= max_ordering_for_quiz + 1
  end

  def max_ordering_for_quiz
    quiz.quiz_question_associators.pluck('MAX(ordering)').first || 0
  end

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
#  ordering      :integer
#
# Indexes
#
#  index_quiz_question_associators_on_quiz_id_and_question_id  (quiz_id,question_id)
#

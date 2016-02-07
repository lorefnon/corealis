class QuizQuestionAssociator < ActiveRecord::Base
  belongs_to :question
  belongs_to :quiz
  belongs_to :associator, class_name: 'AdminUser'
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

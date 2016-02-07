class QuizQuestionAssociator < ActiveRecord::Base
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

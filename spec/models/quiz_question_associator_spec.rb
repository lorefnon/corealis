require 'rails_helper'

RSpec.describe QuizQuestionAssociator, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
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

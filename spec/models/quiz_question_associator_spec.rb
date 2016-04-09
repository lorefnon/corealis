require 'rails_helper'

RSpec.describe QuizQuestionAssociator, type: :model do
  it 'auto populates ordering incrementally' do
    orderings = create(:quiz, :having_many_questions)
      .quiz_question_associators
      .pluck(:ordering)
    expect(orderings).to eq orderings.sort
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

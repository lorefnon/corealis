require 'rails_helper'

RSpec.describe Quiz, type: :model do

  context 'associations' do
    context 'questions' do
      it 'is ordered' do
        quiz = create :quiz
        admin = create :admin_user
        map_question_id_to_ordering = 100
          .times
          .sort_by{ rand(100) }
          .map{|ordering| [create(:question).id, ordering] }
          .to_h
        map_question_id_to_ordering.each do |id, ordering|
          quiz.quiz_question_associators.create!(
            question_id: id,
            ordering: ordering,
            associator: admin
          )
        end
        prev_ordering = nil
        quiz.questions.each do |question|
          ordering = map_question_id_to_ordering[question.id]
          if prev_ordering
            expect(ordering >= prev_ordering).to be true
          end
          prev_ordering = ordering
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

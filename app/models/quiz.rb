class Quiz < ActiveRecord::Base

  has_paper_trail

  has_many :quiz_question_associators
  has_many :questions, through: :quiz_question_associators
  has_many :answers, through: :questions

  belongs_to :creator, class_name: 'AdminUser'

  def associate_questions_through(associator:, question_id:)
    Array(question_id).reduce(
      quiz_question_associators
        .where(question_id: question_id)
        .index_by(&:question_id)
    ) do |memo, id|
      memo[id.to_i] ||= quiz_question_associators.create!(
        associator: associator,
        question_id: id
      )
      memo
    end
  end

end

# == Schema Information
#
# Table name: quizzes
#
#  id         :integer          not null, primary key
#  title      :string
#  creator_id :integer
#  duration   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

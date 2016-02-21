class Quiz < ActiveRecord::Base

  extend FriendlyId
  has_paper_trail

  has_many :quiz_sessions
  has_many :quiz_question_associators
  has_many :questions, through: :quiz_question_associators
  has_many :answers, through: :questions

  belongs_to :creator, class_name: 'AdminUser'

  validates :title, presence: true
  friendly_id :title, use: :slugged

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

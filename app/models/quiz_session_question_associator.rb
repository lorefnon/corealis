class QuizSessionQuestionAssociator < ActiveRecord::Base
  belongs_to :quiz_session
  has_one :quiz, through: :quiz_session
  belongs_to :question
end

class Quiz < ActiveRecord::Base
  has_many :quiz_question_associators
  has_many :questions, through: :quiz_question_associators
  has_many :answers, through: :questions
  belongs_to :creator, class_name: 'AdminUser'
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

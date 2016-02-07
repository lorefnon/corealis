class Answer < ActiveRecord::Base

  belongs_to :question
  belongs_to :answerer, polymorphic: true
  belongs_to :quiz_session

  scope :canonical, -> { where canonical: true }

end

# == Schema Information
#
# Table name: answers
#
#  id              :integer          not null, primary key
#  question_id     :integer
#  details         :text
#  answerer_id     :integer
#  answerer_type   :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  canonical       :boolean
#  quiz_session_id :integer
#

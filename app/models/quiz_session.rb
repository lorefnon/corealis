class QuizSession < ActiveRecord::Base

  belongs_to :quiz
  belongs_to :invitation
  belongs_to :interviewer
  belongs_to :interviewee

  scope :recent, -> { where created_at: (DateTime.now - 1.week)..(DateTime.now) }

end

# == Schema Information
#
# Table name: quiz_sessions
#
#  id             :integer          not null, primary key
#  quiz_id        :integer
#  invitation_id  :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  interviewer_id :integer
#  interviewee_id :integer
#

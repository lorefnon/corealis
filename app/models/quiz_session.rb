class QuizSession < ActiveRecord::Base

  has_paper_trail

  belongs_to :quiz
  belongs_to :invitation
  belongs_to :interviewer, class_name: 'AdminUser'
  belongs_to :interviewee, class_name: 'User'
  has_many :questions, through: :quiz
  has_many :answers

  scope :recent, -> { where created_at: (DateTime.now - 1.week)..(DateTime.now) }
  scope :active, -> { where expired_at: nil }
  scope :expired, -> { where 'expired_at is not null' }

end

# == Schema Information
#
# Table name: quiz_sessions
#
#  id             :integer          not null, primary key
#  quiz_id        :integer
#  invitation_id  :integer
#  interviewee_id :integer
#  interviewer_id :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  started_at     :datetime
#  expired_at     :datetime
#  ended_at       :datetime
#
# Indexes
#
#  index_quiz_sessions_on_interviewee_id                     (interviewee_id)
#  index_quiz_sessions_on_interviewer_id_and_interviewee_id  (interviewer_id,interviewee_id)
#  index_quiz_sessions_on_invitation_id_and_quiz_id          (invitation_id,quiz_id)
#

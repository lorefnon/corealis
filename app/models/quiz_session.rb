class QuizSession < ApplicationRecord

  has_paper_trail
  extend Memoist

  scope :recent, -> { where created_at: (DateTime.now - 10.minutes)..(DateTime.now) }
  scope :active, -> { where expired_at: nil, ended_at: nil }
  scope :expired, -> { where 'expired_at is not null' }
  scope :ended, -> { where 'ended_at is not null' }
  scope :for_invitation, ->(iv) { where invitation: iv }

  belongs_to :quiz
  belongs_to :invitation
  belongs_to :interviewer, class_name: 'AdminUser'
  belongs_to :interviewee, class_name: 'Applicant'
  has_many :questions, through: :quiz
  has_many :answers, -> { order(:created_at) }
  has_many :submitted_answers,
    -> { submitted.order(:created_at) },
    class_name: 'Answer'
  has_many :submitted_questions,
    through: :submitted_answers,
    source: :question

  before_validation :deduce_associations_from_interview

  validates :quiz_id, presence: true

  def next_question
    if submitted_questions.count.zero?
      questions
    else
      questions.where('questions.id not in (?)', submitted_questions.pluck(:id))
    end.first
  end

  def expired?
    expired_at.present?
  end

  def ended?
    ended_at.present?
  end

  def active?
    ! expired? and ! ended?
  end

  private

  def deduce_associations_from_interview
    return unless invitation
    self.interviewer ||= invitation.invitor
    self.interviewee ||= invitation.invitee
    self.quiz ||= invitation.quiz
  end

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

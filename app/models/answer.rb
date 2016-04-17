class Answer < ApplicationRecord

  has_paper_trail

  belongs_to :question
  belongs_to :answerer, polymorphic: true
  belongs_to :quiz_session

  scope :canonical, -> { where canonical: true }
  scope :submitted, -> { where 'submitted_at is not null' }
  scope :pending_submission, -> { where(canonical: false, submitted_at: nil) }

  validates :question_id,
            :answerer_id,
            :answerer_type,
            presence: true

  with_options if: :answered_by_applicant? do
    validates :canonical, inclusion: { in: [false] }
    validates :quiz_session_id, presence: true
    validate  :ensure_quiz_session_active, on: :create
    validate  :ensure_unsubmitted, on: :update
  end

  validates :answerer_type, inclusion: { in: %w[Applicant AdminUser] }

  before_validation :deduce_answerer_from_quiz_session

  def answered_by_applicant?
    answerer_type == 'Applicant'
  end

  def submitted?
    submitted_at.present?
  end

  private

  def deduce_answerer_from_quiz_session
    return if answerer
    return unless quiz_session
    self.answerer = quiz_session.interviewee
  end

  def ensure_quiz_session_active
    unless quiz_session.active?
      errors[:base] << 'Quiz session is no longer active'
    end
  end

  def ensure_unsubmitted
    if submitted?
      errors[:base] << 'Answer has already been submitted'
    end
  end

end

# == Schema Information
#
# Table name: answers
#
#  id              :integer          not null, primary key
#  question_id     :integer          not null
#  details         :text
#  answerer_id     :integer          not null
#  answerer_type   :string           not null
#  quiz_session_id :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  canonical       :boolean          default(FALSE), not null
#  history         :jsonb
#  submitted_at    :datetime
#
# Indexes
#
#  index_answers_on_id_and_question_id_and_quiz_session_id         (id,question_id,quiz_session_id) UNIQUE
#  index_answers_on_question_id_and_answerer_id_and_answerer_type  (question_id,answerer_id,answerer_type)
#  index_answers_on_question_id_and_canonical                      (question_id,canonical)
#  index_answers_on_quiz_session_id_and_question_id                (quiz_session_id,question_id)
#

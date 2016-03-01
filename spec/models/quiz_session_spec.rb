require 'rails_helper'

RSpec.describe QuizSession, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
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

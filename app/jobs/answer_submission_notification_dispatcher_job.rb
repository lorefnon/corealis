class AnswerSubmissionNotificationDispatcherJob < ApplicationJob

  queue_as :default
  include QuizSessionChannelSupport

  def perform(answer_id)
    return unless answer = Answer.find_by(id: answer_id)
    return unless answer.quiz_session_id
    broad_quiz_session_operation answer.quiz_session_id, 'answer:submitted', answer.to_json
  end

end

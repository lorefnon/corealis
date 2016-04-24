class AnswerSubmissionNotificationDispatcherJob < ApplicationJob

  queue_as :default

  def perform(answer_id)
    return unless answer = Answer.find_by(id: answer_id)
    return unless answer.quiz_session_id
    ActionCable.server.broadcast broadcast_stream_name(answer), {
      op: 'answer:submitted',
      args: answer.to_json
    }
  end

  def broadcast_stream_name(answer)
    "quiz_session_notifications_#{answer.quiz_session_id}"
  end

end

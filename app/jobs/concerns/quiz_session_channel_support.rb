module QuizSessionChannelSupport

  extend ActiveSupport::Concern
  include OperationBroadcastSupport

  def quiz_session_stream(quiz_session_id)
    "quiz_session_notifications_#{quiz_session_id}"
  end

  def broadcast_quiz_session_operation(quiz_session_id, operation, payload)
    broadcast_operation(quiz_session_stream(quiz_session_id), operation, payload)
  end

end

class QuizSessionChannel < ApplicationCable::Channel

  def subscribed
    stream_from broadcast_stream_name
  end

  def unsubscribed
  end

  def update_answer(patch_set)
    ActionCable.server.broadcast broadcast_stream_name,
      op: 'answer:edited',
      args: patch_set
  end

  private

  def broadcast_stream_name
    "quiz_session_notifications_#{quiz_session.id}"
  end

end

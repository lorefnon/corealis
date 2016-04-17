class QuizSessionChannel < ApplicationCable::Channel

  def subscribed
    stream_from broadcast_channel_name
  end

  def unsubscribed
  end

  def update_answer(patch_set)
    ActionCable.server.broadcast broadcast_channel_name
  end

  private

  def broadcast_channel_name
    "quiz_session_notifications_#{quiz_session.id}"
  end

end

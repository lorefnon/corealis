class QuizSessionChannel < ApplicationCable::Channel

  include QuizSessionChannelSupport

  def subscribed
    stream_from quiz_session_stream(quiz_session.id)
  end

  def unsubscribed
  end

  def answer_edited(payload)
    broadcast_quiz_session_operation quiz_session.id, 'answer:edited', payload
  end

end

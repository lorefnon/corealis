module ApplicationCable
  class Connection < ActionCable::Connection::Base

    identified_by :quiz_session

    def connect
      self.quiz_session = find_quiz_session
    end

    private

    # TODO FIXME
    def find_quiz_session
      if qs = QuizSession.find_by(id: cookies.signed[:quiz_session_id])
        qs
      else
        reject_unauthorized_connection
      end
    end

  end
end

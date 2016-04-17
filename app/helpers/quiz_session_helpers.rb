module QuizSessionHelpers

  def preview?
    current_admin_user.present?
  end

  def page_title(quiz_session)
    if preview?
      "Previewing Quiz on #{quiz_session.quiz.title.titleize} with #{quiz_session.interviewee.name.titleize}"
    else
      "Quiz on #{quiz_session.quiz.title}"
    end
  end

  def can_end?
    preview? && ! @quiz_session.ended?
  end

end

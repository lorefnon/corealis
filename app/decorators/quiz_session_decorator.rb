class QuizSessionDecorator < Draper::Decorator

  delegate_all
  extend Memoist

  def current_question
    if submitted_questions_count == 0
      next_question
    else
      current_answer.question
    end.decorate
  end

  def current_answer
    if submitted_questions_count == 0
      current_question.answers.where(quiz_session: @quiz_session).build
    else
      answers.last
    end
  end

  def submitted_questions_count
    submitted_questions.count
  end

  memoize :submitted_questions_count

  def questions_count
    questions.count
  end

  memoize :questions_count

end

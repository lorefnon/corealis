module Features
  module QuizHelpers

    def fill_quiz_details(quiz=nil)
      quiz ||= build(:quiz)
      fill_in 'quiz_title', with: quiz.title
      fill_in 'quiz_duration', with: quiz.duration
      quiz
    end

    def fill_question_details(question=nil)
      question ||= build(:question)
      fill_in 'question_title', with: question.title
      fill_in 'question_description', with: question.description
      question
    end

  end
end

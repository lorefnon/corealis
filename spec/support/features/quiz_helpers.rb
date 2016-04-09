module Features
  module QuizHelpers

    def fill_quiz_details(quiz=nil)
      quiz ||= build(:quiz)
      fill_in 'quiz_title', with: quiz.title
      fill_in 'quiz_duration', with: quiz.duration
    end

  end
end

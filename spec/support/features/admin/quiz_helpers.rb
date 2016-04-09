module Features
  module Admin
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

      def quiz_details_panel
      end

      def quiz_questions_panel
        page.find(:panel, 'Questions')
      end

      def quiz_question_row(question)
        quiz_questions_panel.find(:xpath, ".//td[contains(@class, 'col-id')][.='#{question.id}']//ancestor::tr")
      end

      def quiz_question_row_checkbox(question)
        quiz_question_row(question).find(:xpath, ".//input[@type='checkbox'][@name='question_id[#{question.id}]']")
      end

    end
  end
end

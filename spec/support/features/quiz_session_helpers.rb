module Features
  module QuizSessionHelpers

    def fill_in_answer_to_presented_question(answer=nil)
      answer ||= build(:answer)
      editor = page.find('.answer-details-container trix-editor')
      editor.set(answer.details)
      answer
    end

    def submit_answer_to_presented_question(answer=nil)
      answer = fill_in_answer_to_presented_question
      click_on 'Submit'
      answer
    end

    def presented_question_title
      page.find('.question-container .que-title').text
    end

    def presented_question_description
      page.find('.question-container .que-description').text
    end

    def presented_answer_description
      page.find('.answer-container .section-description').text
    end

    def answer_editor
      page.find '.answer-details-container trix-editor'
    end

    def toast_messages
      page.find_all('.toast-message').map(&:text)
    end

  end
end

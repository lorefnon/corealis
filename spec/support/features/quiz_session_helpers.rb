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

  end
end

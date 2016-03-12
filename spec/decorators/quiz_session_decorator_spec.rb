require 'spec_helper'

describe QuizSessionDecorator do

  context 'having no attempts' do

    subject do
      build(:quiz_session).decorate
    end

    describe '#current_question' do
      it { is_expected.to eql subject.questions.first }
    end
  end

  context 'having many attempt' do

    subject do
      build(:quiz_session).decorate
    end
  end

end

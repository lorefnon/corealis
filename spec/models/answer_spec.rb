require 'rails_helper'

RSpec.describe Answer, type: :model do

  context 'Answered by Admin' do
    subject { build(:answer, :answered_by_admin)}
    it 'can be canonical' do
      subject.canonical = true
      subject.valid?
      expect(subject.errors.messages[:canonical]).to be_blank
    end
    it 'may not have a quiz session' do
      subject.quiz_session = nil
      subject.valid?
      expect(subject.errors.messages[:quiz_session_id]).to be_blank
    end
  end

  context 'Answered by Applicant' do
    subject { build(:answer, :answered_by_applicant) }
    it 'can not be canonical' do
      subject.canonical = true
      expect(subject).to_not be_valid
      expect(subject.errors.messages[:canonical]).to include "is not included in the list"
    end

    it 'must have a quiz session' do
      subject.quiz_session = nil
      subject.valid?
      expect(subject.errors.messages[:quiz_session_id]).to include "can't be blank"
    end
  end

  it 'deduces answerer from quiz session' do
    answer = build(:answer)
    answer.quiz_session = create(:quiz_session)
    answer.valid?
    expect(answer.answerer).to eq answer.quiz_session.interviewee
  end

end

# == Schema Information
#
# Table name: answers
#
#  id              :integer          not null, primary key
#  question_id     :integer          not null
#  details         :text
#  answerer_id     :integer          not null
#  answerer_type   :string           not null
#  quiz_session_id :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  canonical       :boolean          default(FALSE), not null
#
# Indexes
#
#  index_answers_on_id_and_question_id_and_quiz_session_id         (id,question_id,quiz_session_id) UNIQUE
#  index_answers_on_question_id_and_answerer_id_and_answerer_type  (question_id,answerer_id,answerer_type)
#  index_answers_on_question_id_and_canonical                      (question_id,canonical)
#  index_answers_on_quiz_session_id_and_question_id                (quiz_session_id,question_id)
#

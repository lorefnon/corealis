ActiveAdmin.register QuizSession do

  menu priority: 6

  filter :started_at
  filter :ended_at
  filter :quiz_title_starts_with

  config.clear_action_items!
  config.batch_actions = false

  index do
    column :id
    column :quiz
    column :interviewer
    column :interviewee
    column :started_at
    column :ended_at
    actions
  end

  show do
    attributes_table do
      row :id
      row :quiz
      row :interviewer
      row :interviewee
      row :started_at
      row :ended_at
    end
    panel "Questions" do
      table_for quiz_session.answers.includes(:question) do
        column :question do |answer|
          link_to answer.question.title, admin_question_path(answer.question)
        end
        column :answer do |answer|
          answer.details.to_s.html_safe
        end
      end
    end
  end

  controller do
    def scoped_collection
      super.includes(:quiz, :interviewer, :interviewee)
    end
  end

  action_item :preview_quiz_session, only: :show do
    link_to "Preview Session", quiz_session_preview_path(resource)
  end

end

# == Schema Information
#
# Table name: quiz_sessions
#
#  id             :integer          not null, primary key
#  quiz_id        :integer
#  invitation_id  :integer
#  interviewee_id :integer
#  interviewer_id :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  started_at     :datetime
#  expired_at     :datetime
#  ended_at       :datetime
#
# Indexes
#
#  index_quiz_sessions_on_interviewee_id                     (interviewee_id)
#  index_quiz_sessions_on_interviewer_id_and_interviewee_id  (interviewer_id,interviewee_id)
#  index_quiz_sessions_on_invitation_id_and_quiz_id          (invitation_id,quiz_id)
#

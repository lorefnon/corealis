ActiveAdmin.register Answer do

  menu false
  config.filters = false
  config.clear_action_items!

  permit_params :id, :question_id, :details, :answer_id, :answer_type, :canonical

  show do
    attributes_table do
      row :id
      row :question_id
      row :details do |answer|
        answer.details.to_s.html_safe
      end
      row :answerer
      row :created_at
      row :updated_at
    end
    render 'admin/versions'
  end

  form do |f|
    inputs "Question" do
      if f.object.persisted?
        input :canonical
      else
        input :canonical, as: :hidden, input_html: { value: params[:canonical] }
        input :question_id, as: :hidden, input_html: { value: params[:question_id] }
      end
      input :details
      actions
    end
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

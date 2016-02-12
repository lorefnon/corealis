ActiveAdmin.register Question do

  menu priority: 3
  decorate_with QuestionDecorator

  permit_all_params

  index do
    selectable_column
    column :id
    column :title
    column :creator
    column :created_at
    column :updated_at
    actions
  end

  form do |f|
    inputs 'Question' do
      input :title
      input :description, as: :markdown
      render 'admin/creator_form_entry', form: f
      actions
    end
  end

  show do

    attributes_table do
      row :title
      row :description do |it|
        it.rendered_description.html_safe
      end
      row :creator
    end

    render 'admin/versions'

    panel "Canonical Answers" do
      if question.answers.canonical.any?
        table_for question.answers.canonical do
          column :id do |it|
            link_to it.id, admin_answer_path(it)
          end
          column :details
        end
      else
        div "No Canonical Answers have been added yet"
      end
      div link_to "Add Canonical Answer", new_admin_answer_path(canonical: true, question_id: question.id)
      div link_to "View All Answers", admin_answers_path(q: { question_id_eq: question.id })
    end

    active_admin_comments

  end

  batch_action :add_to_quiz do |ids|
    redirect_to admin_quiz_question_selection_path(question_id: ids)
  end

  action_item :view_answers, only: :show do
    link_to "View All Answers", admin_answers_path(q: { question_id_eq: question.id })
  end

end

# == Schema Information
#
# Table name: questions
#
#  id          :integer          not null, primary key
#  title       :string
#  description :text
#  creator_id  :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

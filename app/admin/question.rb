ActiveAdmin.register Question do

  decorate_with QuestionDecorator

  permit_params *(@resource.column_names)

  index do
    column :select do |it|
      check_box_tag "question", true, false, class: 'question-cbox', 'data-question-id' => it.id
    end
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
    render 'admin/versions', model: question
    active_admin_comments
  end

  collection_action :add_to_quiz do
    render 'admin/questions/add_to_quiz'
  end

  action_item :add_to_quiz, only: :index do
    link_to "Add to Quiz", add_to_quiz_admin_questions_path, remote: true
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

ActiveAdmin.register Quiz do

  permit_params *(@resource.column_names), question_ids: []

  controller do

    def create
      super
      associate_questions
    end

    def associate_questions
      if resource && resource.persisted? && params[:question_id].any?
        resource.associate_questions_through(
          associator: current_admin_user,
          question_id: params[:question_id]
        )
      end
    end

  end

  show do

    attributes_table do
      row :id
      row :title
      row :creator
      row :duration
      row :created_at
      row :updated_at
    end

    panel "Questions" do
      table_for quiz.questions do
        column :id do |it|
          link_to it.id, admin_question_path(it)
        end
        column :title
        column :creator
        column :created_at
        column :updated_at
      end
    end

  end

  form do |f|
    inputs 'Quiz' do
      input :title
      input :duration
      render 'admin/creator_form_entry', form: f
      if params[:question_id]
        Array(params[:question_id]).each do |question_id|
          li class: 'hidden input' do
            hidden_field_tag 'question_id[]', question_id
          end
        end
      end
      actions
    end
  end

end

# == Schema Information
#
# Table name: quizzes
#
#  id         :integer          not null, primary key
#  title      :string
#  creator_id :integer
#  duration   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

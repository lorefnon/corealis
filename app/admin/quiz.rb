ActiveAdmin.register Quiz do

  permit_params *(@resource.column_names), question_ids: []

  controller do

    def create
      super
      associate_questions
    end

    def associate_questions
      if resource && resource.persisted? && ! params[:question_id].blank?
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

    if quiz.questions.any?
      render 'admin/quizzes/quiz_question_removal', quiz: quiz
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

  collection_action :associate_questions, method: :post do
    Quiz
      .find(params[:quiz_id])
      .associate_questions_through(
        associator: current_admin_user,
        question_id: params[:question_id].keys
      ) unless params[:question_id].blank?
    redirect_to admin_quiz_path params[:quiz_id]
  end

  member_action :remove_questions, method: :delete do
    resource
      .quiz_question_associators
      .where(question_id: params[:question_id])
      .destroy_all
    redirect_to admin_quiz_path resource
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

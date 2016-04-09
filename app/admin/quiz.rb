ActiveAdmin.register Quiz do

  menu priority: 2
  permit_params :id, :title, :creator_id, :creator, :duration, question_ids: []

  filter :title
  filter :duration
  filter :created_at
  filter :updated_at

  controller do

    def create
      super
      associate_questions_from_params
    end

    def associate_questions_from_params
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

    render 'admin/versions'

  end

  form do |f|
    inputs 'Quiz' do
      input :title
      input :duration, label: 'Duration of quiz in seconds'
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

  action_item :add_question, only: :show do
    link_to 'Add Question', new_admin_question_path('quiz_id' => params[:id])
  end

  action_item :view_invitations, only: :show do
    link_to 'View Invitations', admin_invitations_path('q[quiz_id_eq]' => params[:id])
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
#  title      :string           not null
#  creator_id :integer          not null
#  duration   :integer
#  slug       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_quizzes_on_creator_id_and_slug  (creator_id,slug)
#  index_quizzes_on_slug                 (slug) UNIQUE
#

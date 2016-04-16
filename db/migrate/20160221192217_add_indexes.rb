class AddIndexes < ActiveRecord::Migration[4.2]
  def change
    add_index :settings, :key, unique: true
    add_index :quizzes, :slug, unique: true
    add_index :quizzes, [:creator_id, :slug]
    add_index :quiz_sessions, [:invitation_id, :quiz_id]
    add_index :quiz_sessions, :interviewee_id
    add_index :quiz_sessions, [:interviewer_id, :interviewee_id]
    add_index :quiz_question_associators, [:quiz_id, :question_id]
    add_index :questions, :slug, unique: true
    add_index :online_resources, :provider_id
    add_index :online_resources, :category
    add_index :online_resource_providers, :label, unique: true
    add_index :online_resource_applicant_associators, [:applicant_id, :online_resource_id], name: :index_oraa_a_id_o_r_id
    add_index :invitations, [:id, :status]
    add_index :invitations, [:id, :valid_from, :valid_till]
    add_index :invitations, :quiz_id
    add_index :applicants, :username, unique: true
    add_index :applicants, :email, unique: true
    add_index :applicants, :phone_number
    add_index :applicants, :creator_id
    add_index :applicants, :experience
    add_index :answers, [:question_id, :canonical]
    add_index :answers, [:question_id, :answerer_id, :answerer_type]
    add_index :answers, [:quiz_session_id, :question_id]
  end
end

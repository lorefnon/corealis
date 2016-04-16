class AddPerSessionUniquenessContraintOnAnswers < ActiveRecord::Migration[4.2]
  def change
    add_index :answers, [:id, :question_id, :quiz_session_id], unique: true
  end
end

class AddPerSessionUniquenessContraintOnAnswers < ActiveRecord::Migration
  def change
    add_index :answers, [:id, :question_id, :quiz_session_id], unique: true
  end
end

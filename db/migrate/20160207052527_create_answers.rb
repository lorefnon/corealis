class CreateAnswers < ActiveRecord::Migration[4.2]
  def change
    create_table :answers do |t|
      t.integer :question_id, null: false
      t.text :details
      t.integer :answerer_id, null: false
      t.string :answerer_type, null: false
      t.integer :quiz_session_id
      t.timestamps null: false
    end
  end
end

class CreateQuizQuestionAssociators < ActiveRecord::Migration
  def change
    create_table :quiz_question_associators do |t|
      t.integer :question_id
      t.integer :quiz_id
      t.integer :associator_id

      t.timestamps null: false
    end
  end
end

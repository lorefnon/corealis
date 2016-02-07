class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.integer :question_id
      t.text :details
      t.integer :answerer_id
      t.integer :answerer_type

      t.timestamps null: false
    end
  end
end

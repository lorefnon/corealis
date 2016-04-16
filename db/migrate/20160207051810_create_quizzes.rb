class CreateQuizzes < ActiveRecord::Migration[4.2]
  def change
    create_table :quizzes do |t|
      t.string :title, null: false
      t.integer :creator_id, null: false
      t.integer :duration
      t.string :slug, null: false
      t.timestamps null: false
    end
  end
end

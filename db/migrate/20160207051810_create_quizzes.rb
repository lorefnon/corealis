class CreateQuizzes < ActiveRecord::Migration
  def change
    create_table :quizzes do |t|
      t.string :title
      t.integer :creator_id
      t.integer :duration

      t.timestamps null: false
    end
  end
end

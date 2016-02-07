class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :title
      t.text :description
      t.integer :creator_id

      t.timestamps null: false
    end
  end
end

class CreateQuestions < ActiveRecord::Migration[4.2]
  def change
    create_table :questions do |t|
      t.string :title, null: false
      t.text :description
      t.integer :creator_id, null: false
      t.string :slug, null: false
      t.timestamps null: false
    end
  end
end

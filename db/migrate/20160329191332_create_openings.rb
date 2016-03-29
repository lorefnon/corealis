class CreateOpenings < ActiveRecord::Migration
  def change
    create_table :openings do |t|
      t.string :title, null: false
      t.string :slug, null: false
      t.string :description
      t.boolean :current, null: false, default: true
      t.boolean :showcased, null: false, default: false
      t.integer :creator_id, null: false
      t.timestamps null: false
    end
  end
end

class CreateSettings < ActiveRecord::Migration[4.2]
  def change
    create_table :settings do |t|
      t.string :key, null: false
      t.string :value, null: false
      t.timestamps null: false
    end
  end
end

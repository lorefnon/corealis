class CreateSettings < ActiveRecord::Migration
  def change
    create_table :settings do |t|
      t.string :key
      t.jsonb :value
      t.timestamps null: false
    end
  end
end

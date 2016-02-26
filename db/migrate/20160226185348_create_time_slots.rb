class CreateTimeSlots < ActiveRecord::Migration
  def change
    create_table :time_slots do |t|
      t.datetime :starts_at, null: false
      t.datetime :ends_at, null: false
      t.timestamps null: false
    end
  end
end

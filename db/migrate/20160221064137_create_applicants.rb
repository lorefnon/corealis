class CreateApplicants < ActiveRecord::Migration
  def change
    create_table :applicants do |t|
      t.integer :creator_id
      t.string :name
      t.string :email
      t.string :phone_number
      t.integer :quiz_sessions_count
      t.decimal :experience
      t.timestamps null: false
    end
  end
end

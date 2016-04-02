class CreateApplicants < ActiveRecord::Migration
  def change
    create_table :applicants do |t|
      t.integer :creator_id
      t.string :name, null: false
      t.string :username
      t.string :email, null: false
      t.string :phone_number
      t.integer :quiz_sessions_count, default: 0, null: false
      t.decimal :experience
      t.timestamps null: false
    end
  end
end

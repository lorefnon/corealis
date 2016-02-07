class CreateQuizSessions < ActiveRecord::Migration
  def change
    create_table :quiz_sessions do |t|
      t.integer :quiz_id
      t.integer :invitation_id
      t.integer :user_id

      t.timestamps null: false
    end
  end
end

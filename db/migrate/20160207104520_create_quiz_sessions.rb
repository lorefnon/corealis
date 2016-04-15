class CreateQuizSessions < ActiveRecord::Migration[4.2]
  def change
    create_table :quiz_sessions do |t|
      t.integer :quiz_id
      t.integer :invitation_id
      t.integer :interviewee_id
      t.integer :interviewer_id
      t.timestamps null: false
    end
  end
end

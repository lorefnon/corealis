class AddStartedAtAndExpiredAtToQuizSessions < ActiveRecord::Migration[4.2]
  def change
    add_column :quiz_sessions, :started_at, :datetime
    add_column :quiz_sessions, :expired_at, :datetime
    add_column :quiz_sessions, :ended_at, :datetime
  end
end

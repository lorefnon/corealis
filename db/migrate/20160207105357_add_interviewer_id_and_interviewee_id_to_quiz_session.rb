class AddInterviewerIdAndIntervieweeIdToQuizSession < ActiveRecord::Migration
  def change
    remove_column :quiz_sessions, :user_id
    add_column :quiz_sessions, :interviewer_id, :integer
    add_column :quiz_sessions, :interviewee_id, :integer
  end
end

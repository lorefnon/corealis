class AddQuizSessionIdToAnswers < ActiveRecord::Migration
  def change
    add_column :answers, :quiz_session_id, :integer
  end
end

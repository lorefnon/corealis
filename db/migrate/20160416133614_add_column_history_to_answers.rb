class AddColumnHistoryToAnswers < ActiveRecord::Migration[5.0]
  def change
    add_column :answers, :history, :jsonb
  end
end

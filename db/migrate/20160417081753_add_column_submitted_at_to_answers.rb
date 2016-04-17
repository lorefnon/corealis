class AddColumnSubmittedAtToAnswers < ActiveRecord::Migration[5.0]
  def change
    add_column :answers, :submitted_at, :datetime
  end
end

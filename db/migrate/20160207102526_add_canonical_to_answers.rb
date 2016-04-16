class AddCanonicalToAnswers < ActiveRecord::Migration[4.2]
  def change
    add_column :answers, :canonical, :boolean, null: false, default: false
  end
end

class AddCanonicalToAnswers < ActiveRecord::Migration
  def change
    add_column :answers, :canonical, :boolean, null: false, default: false
  end
end

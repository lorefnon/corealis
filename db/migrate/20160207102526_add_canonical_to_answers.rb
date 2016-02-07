class AddCanonicalToAnswers < ActiveRecord::Migration
  def change
    add_column :answers, :canonical, :boolean
  end
end

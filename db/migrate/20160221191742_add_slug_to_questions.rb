class AddSlugToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :slug, :string, unique: true, null: false
  end
end

class AddSlugToQuizzes < ActiveRecord::Migration
  def change
    add_column :quizzes, :slug, :string, unique: true, null: false
  end
end

class AddOrderingToQuizSessionAssociators < ActiveRecord::Migration
  def change
    add_column :quiz_question_associators, :ordering, :integer
  end
end

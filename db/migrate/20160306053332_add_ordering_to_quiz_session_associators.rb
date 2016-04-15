class AddOrderingToQuizSessionAssociators < ActiveRecord::Migration[4.2]
  def change
    add_column :quiz_question_associators, :ordering, :integer
  end
end

class AddUniquenessContraintOnApplicationSubmissions < ActiveRecord::Migration[4.2]
  def change
    add_index :application_submissions, [:applicant_id, :opening_id], unique: true
  end
end

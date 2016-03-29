class CreateApplicationSubmissions < ActiveRecord::Migration
  def change
    create_table :application_submissions do |t|
      t.integer :applicant_id, null: false
      t.integer :opening_id
      t.description :cover_letter

      t.timestamps null: false
    end
  end
end

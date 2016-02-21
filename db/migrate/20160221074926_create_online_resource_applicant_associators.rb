class CreateOnlineResourceApplicantAssociators < ActiveRecord::Migration
  def change
    create_table :online_resource_applicant_associators do |t|
      t.integer :online_resource_id, null: false
      t.integer :applicant_id, null: false

      t.timestamps null: false
    end
  end
end

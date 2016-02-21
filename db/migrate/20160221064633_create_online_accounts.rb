class CreateOnlineAccounts < ActiveRecord::Migration
  def change
    create_table :online_accounts do |t|
      t.integer :applicant_id, null: false
      t.string :url, null: false
      t.integer :provider_id, null: false
      t.string :identity
      t.timestamps null: false
    end
  end
end

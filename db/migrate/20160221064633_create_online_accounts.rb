class CreateOnlineAccounts < ActiveRecord::Migration[4.2]
  def change
    create_table :online_resources do |t|
      t.string :url, null: false
      t.string :category
      t.integer :provider_id, null: false
      t.string :identity
      t.timestamps null: false
    end
  end
end

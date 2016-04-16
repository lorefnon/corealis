class CreateOnlineResourceProviders < ActiveRecord::Migration[4.2]
  def change
    create_table :online_resource_providers do |t|
      t.string :root_url, null: false
      t.string :label, null: false
      t.string :name, null: false

      t.timestamps null: false
    end
  end
end

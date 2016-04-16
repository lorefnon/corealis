class CreateInvitations < ActiveRecord::Migration[4.2]
  def change
    create_table :invitations do |t|
      t.integer :invitor_id, null: false
      t.integer :invitee_id, null: false
      t.integer :quiz_id, null: false
      t.integer :status, default: 0
      t.datetime :valid_from
      t.datetime :valid_till
      t.integer :duration
      t.timestamps null: false
    end
  end
end

class CreateInvitations < ActiveRecord::Migration
  def change
    create_table :invitations do |t|
      t.integer :invitor_id
      t.integer :invitee_id
      t.integer :quiz_id
      t.datetime :valid_from
      t.datetime :valid_till
      t.datetime :duration

      t.timestamps null: false
    end
  end
end

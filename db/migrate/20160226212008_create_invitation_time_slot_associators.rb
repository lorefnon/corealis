class CreateInvitationTimeSlotAssociators < ActiveRecord::Migration
  def change
    create_table :invitation_time_slot_associators do |t|
      t.integer :confirmation_status
      t.integer :invitation_id, null: false
      t.integer :proposer_id, null: false
      t.string :proposer_type, null: false
      t.integer :time_slot_id, null: false
      t.timestamps null: false
    end
  end
end

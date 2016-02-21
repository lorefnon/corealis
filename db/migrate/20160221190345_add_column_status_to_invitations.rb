class AddColumnStatusToInvitations < ActiveRecord::Migration
  def change
    add_column :invitations, :status, :integer, default: 0
  end
end

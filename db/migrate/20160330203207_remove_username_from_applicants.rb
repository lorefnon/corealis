class RemoveUsernameFromApplicants < ActiveRecord::Migration
  def change
    remove_column :applicants, :username
  end
end

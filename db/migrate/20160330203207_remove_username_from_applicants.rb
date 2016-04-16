class RemoveUsernameFromApplicants < ActiveRecord::Migration[4.2]
  def change
    remove_column :applicants, :username
  end
end

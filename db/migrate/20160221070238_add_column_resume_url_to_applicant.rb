class AddColumnResumeUrlToApplicant < ActiveRecord::Migration
  def change
    add_column :applicants, :resume_url, :string
  end
end

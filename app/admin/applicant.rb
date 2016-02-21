ActiveAdmin.register Applicant do

  menu priority: 4

  filter :email

  index do
    column :id
    column :email
    actions
  end

  form do |f|
    f.inputs "User" do
      f.input :email
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end

end

# == Schema Information
#
# Table name: applicants
#
#  id                  :integer          not null, primary key
#  creator_id          :integer
#  name                :string
#  email               :string
#  phone_number        :string
#  quiz_sessions_count :integer
#  experience          :decimal(, )
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  resume_url          :string
#

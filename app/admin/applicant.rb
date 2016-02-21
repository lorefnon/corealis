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
#  username            :string
#  email               :string
#  phone_number        :string
#  quiz_sessions_count :integer
#  experience          :decimal(, )
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#
# Indexes
#
#  index_applicants_on_creator_id    (creator_id)
#  index_applicants_on_email         (email) UNIQUE
#  index_applicants_on_experience    (experience)
#  index_applicants_on_phone_number  (phone_number)
#  index_applicants_on_username      (username) UNIQUE
#

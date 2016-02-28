ActiveAdmin.register Applicant do

  menu priority: 4
  permit_params :id, :creator_id, :name, :username, :email, :phone_number, :experience

  filter :email
  filter :experience

  decorate_with ApplicantDecorator

  index do
    column :id
    column :email do |it|
      it.email_link
    end
    column :experience do |it|
      it.humanized_experience
    end
    column :humanized_experience
    column :invitations do |applicant|
      link_to "Schedule Quiz", new_admin_invitation_path(invitee_id: applicant.id)
    end
    actions
  end

  form do |f|
    f.inputs "User" do
      render 'admin/creator_form_entry', form: f
      f.input :email
      f.input :phone_number
      f.input :experience
    end
    f.actions
  end

  action_item :send_invitation, only: :show do
    link_to "Send Invitiation", new_admin_invitation_path(invitee_id: resource.id)
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

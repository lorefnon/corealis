ActiveAdmin.register Invitation do

  menu priority: 4

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if resource.something?
#   permitted
# end

  show do
    attributes_table do
      row :id
      row :invitor_id
      row :quiz_id
      row :valid_from
      row :valid_till
      row :duration
    end
    render 'admin/versions'
  end


end

# == Schema Information
#
# Table name: invitations
#
#  id         :integer          not null, primary key
#  invitor_id :integer
#  invitee_id :integer
#  quiz_id    :integer
#  valid_from :datetime
#  valid_till :datetime
#  duration   :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

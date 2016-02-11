ActiveAdmin.register User do

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

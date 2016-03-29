ActiveAdmin.register Opening do

  permit_params :id, :title, :description, :current, :showcased

  filter :title
  filter :slug
  filter :current
  filter :showcased

  controller do
    before_create :associate_creator

    private

    def associate_creator
      resource.creator = current_admin_user
    end
  end

end

ActiveAdmin.register Opening do

  permit_params :id, :title, :description, :current, :showcased

  filter :title
  filter :slug
  filter :current
  filter :showcased

  controller do
    before_create :associate_creator

    private

    def associate_creator(resource)
      resource.creator = current_admin_user
    end
  end

  form do |f|
    f.inputs "Opening" do
      input :title
      input :description
      input :current
      input :showcased
      actions
    end
  end

end

# == Schema Information
#
# Table name: openings
#
#  id          :integer          not null, primary key
#  title       :string           not null
#  slug        :string           not null
#  description :string
#  current     :boolean          default(TRUE), not null
#  showcased   :boolean          default(FALSE), not null
#  creator_id  :integer          not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

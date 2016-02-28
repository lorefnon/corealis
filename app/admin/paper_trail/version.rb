ActiveAdmin.register PaperTrail::Version do

  menu label: 'Archives'
  decorate_with PaperTrail::VersionDecorator
  config.clear_action_items!

  index(title: 'Archives') do
    selectable_column
    column :id do |it|
      link_to it.id, admin_paper_trail_version_path(it.id)
    end
    column :item_type
    column :event
    column :committer do |it|
      it.committer_admin_link
    end
    column :created_at
  end

  show do
    attributes_table do
      row :id
      row :item
      row :event
      row :whodunnit
      row :object do |it|
        pre do
          it.object
        end
      end
      row :created_at
    end
  end

end

# == Schema Information
#
# Table name: versions
#
#  id         :integer          not null, primary key
#  item_type  :string           not null
#  item_id    :integer          not null
#  event      :string           not null
#  whodunnit  :string
#  object     :text
#  created_at :datetime
#
# Indexes
#
#  index_versions_on_item_type_and_item_id  (item_type,item_id)
#

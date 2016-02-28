ActiveAdmin.register PaperTrail::Version do

  menu label: 'Archives'
  config.clear_action_items!

  index(title: 'Archives') do
    column :id
    column :item_type
    column :event
    column :whodunnit
    column :created_at
    actions
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

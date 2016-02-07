ActiveAdmin.register Question do

  decorate_with QuestionDecorator

  permit_params *(@resource.column_names)

  index do
    column :id
    column :title
    column :creator
    column :created_at
    column :updated_at
    actions
  end

  form do |f|
    inputs 'Question' do
      input :title
      input :description, as: :markdown
      render 'admin/creator_form_entry', form: f
      actions
    end
  end

  show do
    attributes_table do
      row :title
      row :description do |it|
        it.rendered_description.html_safe
      end
      row :creator
    end
    panel "Versions" do
      table_for question.versions do
        column :event
        column :whodunnit
        column :created_at
      end
    end
    active_admin_comments
  end

end

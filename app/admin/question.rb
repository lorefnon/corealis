ActiveAdmin.register Question do

  decorate_with QuestionDecorator

  permit_params *(@resource.column_names)

  form do |f|
    inputs 'Question' do
      input :title
      input :description, hint: 'Supports <a href="https://guides.github.com/features/mastering-markdown/">Github flavored markdown</a>'.html_safe
      if f.object.persisted?
        label 'Creator'
        span f.object.creator.name
      else
        input :creator_id, as: :hidden, input_html: { value: current_admin_user.id }
      end
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
  end

end

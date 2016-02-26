module SlugSupport

  extend ActiveSupport::Concern

  DEFAULT_OPTIONS = {
    slug_attribute: 'slug'
  }

  class_methods do
    def slugify(attribute, options={})

      options.reverse_merge!(DEFAULT_OPTIONS)

      before_save do
        assign_slug attribute, options
      end

    end
  end

  def assign_slug(attribute, options)
    send slug_setter_for(attribute, options), slug_for(attribute)
  end

  def slug_setter_for(attribute, options)
    "#{options[:slug_attribute]}="
  end

  def slug_for(attribute)
    send(attribute).to_slug.to_s
  end

end

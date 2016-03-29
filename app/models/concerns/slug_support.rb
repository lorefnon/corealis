module SlugSupport

  extend ActiveSupport::Concern

  DEFAULT_OPTIONS = {
    slug_attribute: 'slug',
    allow_override: false
  }.freeze

  class_methods do
    def slugify(attribute, options = {})
      options.reverse_merge!(DEFAULT_OPTIONS)

      before_save do
        assign_slug attribute, options
      end
    end
  end

  def assign_slug(attribute, options)
    return if send(options[:slug_attribute]) && !options[:allow_override]
    send "#{options[:slug_attribute]}=", slug_for(attribute)
  end

  def slug_for(attribute)
    send(attribute).to_slug.normalize.to_s
  end

end

Opal.use_gem 'opal-jquery'

Opal::Rails::TemplateHandler.class_eval do

  def call(template)
    escaped = template.source.gsub(':', '\:')
    string = '%q:' + escaped + ':'
    "Opal.compile('Object.new.instance_eval {' << #{local_assigns} << #{string} << '}')"
  end

end

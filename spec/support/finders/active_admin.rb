RSpec.configure do |config|

  Capybara.add_selector(:panel) do
    xpath do |title|
      ".//div[@class='panel']/*[contains(local-name(), 'h')][contains(text(), '#{title}')]"
    end
  end

  Capybara.add_selector(:menu_item) do
    xpath do |label|
      ".//div[@id='header']/li/a[contains(text(), '#{label}')]"
    end
  end

  Capybara.add_selector(:action_item) do
    xpath do |label|
      ".//div[@class='action_item']/a[contains(text(), '#{label}')]"
    end
  end

  Capybara.add_selector(:index_table) do
    xpath do |model_name|
      ".//div[@class='index_as_table']/table[@id='index_table_#{model_name.to_s.underscore.pluralize}']"
    end
  end

  Capybara.add_selector(:attributes_table) do
    xpath do |model_name|
      ".//div[@class='attributes_table #{model_name.to_s.underscore.singularize}']"
    end
  end

  Capybara.add_selector(:attribute_row) do
    xpath do |label|
      ".//tr[contains(@class, 'row')]/th[contains(text(), '#{label.to_s.humanize}')]"
    end
  end

  Capybara.add_selector(:attribute_value) do
    xpath do |label|
      ".//tr[contains(@class, 'row')]/th[contains(text(), '#{label.to_s.humanize}')]/../td"
    end
  end

  Capybara.add_selector(:index_column) do
    xpath do |field|
      ".//thead/tr/th[contains(@class, 'col')][contains(@class, 'col-#{field}')]"
    end
  end

end

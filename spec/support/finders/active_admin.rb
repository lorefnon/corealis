RSpec.configure do |config|

  Capybara.add_selector(:panel) do
    xpath do |title|
      "//div[@class='panel']/*[contains(local-name(), 'h')][contains(text(), '#{title}')]"
    end
  end

end

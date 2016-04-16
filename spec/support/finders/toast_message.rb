RSpec.configure do |config|
  Capybara.add_selector(:toast_message) do
    xpath do |content|
      ".//div[contains(@class, 'toast-message')][contains(text(), '#{content}')]"
    end
  end
end

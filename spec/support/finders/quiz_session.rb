RSpec.configure do |config|
  Capybara.add_selector(:link_to_previous_answer) do
    xpath do |question|
      ".//li[contains(@class,'submitted-que-list-entry')]/a/*[contains(text(), '#{question.title}')]"
    end
  end
end

RSpec::Matchers.define :have_attribute_row do |label|
  match do |table|
    begin
      table
        .find(:xpath, "tr[contains(@class, 'row')]/th[contains(text(), '#{label}')]")
        .present?
    rescue Capybara::ElementNotFound
      false
    end
  end
end

RSpec::Matchers.define :have_index_column do |field|
  match do |table|
    begin
      table
        .find(:xpath, "thead/tr/th[contains(@class, 'col')][contains(@class, 'col-#{field}')]")
        .present?
    rescue Capybara::ElementNotFound
      false
    end
  end
end

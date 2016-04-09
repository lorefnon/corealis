require 'support/finders/active_admin'

RSpec::Matchers.define :have_attribute_row do |label|
  match do |table|
    begin
      table.find(:attribute_row, label)
      true
    rescue Capybara::ElementNotFound
      false
    end
  end
end

RSpec::Matchers.define :have_index_column do |field|
  match do |table|
    begin
      table.find(:index_column, field)
    rescue Capybara::ElementNotFound
      false
    end
  end
end


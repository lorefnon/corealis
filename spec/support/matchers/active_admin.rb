RSpec::Matchers.define :have_attribute_row do |label|
  match do |table|
    begin
      table
        .find(:xpath, "/tr[contains(@class, 'row')]/th[contains(text(), '#{label}')]")
        .present?
    rescue Capybara::ElementNotFound
      false
    end
  end
end

RSpec::Matchers.define :have_index_column do |label|
  match do |table|
    begin
      table
        .find(:xpath, "/thead/tr/th[contains(@class, 'row')]/a[contains(text(), '#{label}')]")
        .present?
    rescue Capybara::ElementNotFound
      false
    end
  end
end

RSpec::Matchers.define :have_index_columns do |labels|
  match do |table|
    labels.map{|col| has_index_column? label }.reduce(:&)
  end
end

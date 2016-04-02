RSpec::Matchers.define :have_opening_listed do |opening|
  match do |page|
    begin
      page.find_link(opening.title, href: opening_path(opening)).present?
    rescue Capybara::ElementNotFound
      false
    end
  end
end

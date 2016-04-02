RSpec::Matchers.define :have_flash_message do |message|
  match do |page|
    page
      .find_all('.flash')
      .find {|it| it.has_content? message }
      .present?
  end
end

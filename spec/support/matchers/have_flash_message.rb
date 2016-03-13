RSpec::Matchers.define :have_flash_message do |expected|
  match do |actual|
    actual
      .find_all('.flash')
      .find {|it| it.has_content? expected }
      .present?
  end
end

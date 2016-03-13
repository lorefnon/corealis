RSpec::Matchers.define :have_node_with_content do |expected|
  match do |actual|
    actual.find {|it| it.has_content? expected }.present?
  end
end

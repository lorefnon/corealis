RSpec::Matchers.define :have_quiz_session_progress do |progress|
  match do |page|
    begin
      page
        .find('.progress-status')
        .has_content? "You have attempted #{progress[:current]} of #{progress[:total]} questions"
    end
  end
end

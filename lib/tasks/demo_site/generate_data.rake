namespace :demo_site do
  task :generate_data => :environment do

    include FactoryGirl::Syntax::Methods

    admin_user = create :admin_user, name: 'admin'
    openings = [
      create(:ruby_developer_opening, creator: admin_user),
      create(:swift_developer_opening, creator: admin_user)
    ]
    quiz = create(:ruby_developer_quiz, creator: admin_user)
    applicant = create(:applicant, name: 'applicant')
    invitation = create(:invitation, :long_spanning,
      invitor: admin_user,
      quiz: quiz,
      invitee: applicant)

  end
end

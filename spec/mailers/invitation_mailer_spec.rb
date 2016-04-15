require "rails_helper"

RSpec.describe InvitationMailer, type: :mailer do

  before(:each) do
    @org_name = Setting['organization.name'] = 'Random Org'
    @invitation = create(:invitation)
  end

  describe '#invitation_mail' do
    subject { InvitationMailer.invitation_mail(@invitation).deliver_now }
    it 'is delivered' do
      expect(ActionMailer::Base.deliveries).to_not be_empty
    end
    it 'is dispatched to invitee' do
      expect(subject.to).to include @invitation.invitee.email
    end
    it 'has correct subject' do
      expect(subject.subject).to eql "Career opportunity at #{@org_name}"
    end
  end

end

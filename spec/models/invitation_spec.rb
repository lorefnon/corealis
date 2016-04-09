require 'rails_helper'

RSpec.describe Invitation, type: :model do
  before(:all) do
    @invitation = build(:invitation)
  end
  before(:each) do
    allow(@invitation).to receive(:dispatch_notification) { true }
  end
  describe 'token' do
    it 'is auto assigned before creation' do
      @invitation.valid?
      expect(@invitation.token).to_not be nil
    end
  end
  describe 'active' do
    context 'scheduled to be valid in future' do
      subject { create(:invitation, :scheduled_for_future) }
      it 'is not included' do
        expect(Invitation.active).to_not include subject
      end
    end
    context 'expired' do
      subject { create(:invitation, :expired) }
      it 'is not included' do
        expect(Invitation.active).to_not include subject
      end
    end
    context 'current' do
      subject { create(:invitation, :current) }
      it 'is included' do
        expect(Invitation.active).to include subject
      end
    end
  end
end

# == Schema Information
#
# Table name: invitations
#
#  id         :integer          not null, primary key
#  invitor_id :integer          not null
#  invitee_id :integer          not null
#  quiz_id    :integer          not null
#  status     :integer          default(0)
#  valid_from :datetime
#  valid_till :datetime
#  duration   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  token      :string
#
# Indexes
#
#  index_invitations_on_id_and_status                     (id,status)
#  index_invitations_on_id_and_valid_from_and_valid_till  (id,valid_from,valid_till)
#  index_invitations_on_quiz_id                           (quiz_id)
#

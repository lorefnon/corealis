class InvitationMailer < ApplicationMailer
  def invitation_mail(invitation)
    @invitation = invitation
  end
end

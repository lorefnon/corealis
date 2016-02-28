class InvitationMailer < ApplicationMailer

  def invitation_mail(invitation)
    @invitation = invitation
    mail to: invitation.invitee.email,
         subject: "Career opportunity at #{Setting['organization.name']}"
  end

end

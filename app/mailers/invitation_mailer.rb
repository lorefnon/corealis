class InvitationMailer < ApplicationMailer

  def invitation_mail(invitation)
    @invitation = invitation
    @quiz = invitation.quiz
    @invitee = invitation.invitee
    mail to: @invitee.email,
         subject: "Career opportunity at #{Setting['organization.name']}"
  end

end

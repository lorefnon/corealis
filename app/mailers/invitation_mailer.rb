class InvitationMailer < ApplicationMailer

  def invitation_mail(invitation)
    @invitation = invitation
    @quiz = invitation.quiz
    @invitee = invitation.invitee
    @subject = "Career opportunity at #{Setting['organization.name']}"
    mail to: @invitee.email, subject: @subject
  end

end

class InvitationDecorator < Draper::Decorator

  delegate_all

  def title
    "#{invitation.invitee.name} -- #{invitation.quiz.title}"
  end

end

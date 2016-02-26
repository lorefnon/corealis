class ApplicantDecorator < Draper::Decorator

  delegate_all
  include EmailLinkSupport

  def humanized_experience
    "#{experience.to_i} years"
  end

end

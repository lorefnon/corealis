ActiveAdmin.register ApplicationSubmission do

  filter :applicant_email_eq
  filter :opening_slug_eq

  config.clear_action_items!

end

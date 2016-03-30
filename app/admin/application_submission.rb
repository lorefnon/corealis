ActiveAdmin.register ApplicationSubmission do

  filter :applicant_email_eq
  filter :opening_slug_eq

  config.clear_action_items!

end

# == Schema Information
#
# Table name: application_submissions
#
#  id           :integer          not null, primary key
#  applicant_id :integer          not null
#  opening_id   :integer
#  cover_letter :text
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

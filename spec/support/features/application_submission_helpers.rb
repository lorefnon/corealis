module Features
  module ApplicationSubmissionHelpers

    def fill_applicant_details(applicant)
      fill_in 'application_submission_applicant_attributes_name', with: applicant.name
      fill_in 'application_submission_applicant_attributes_email', with: applicant.email
      fill_in 'application_submission_applicant_attributes_phone_number', with: applicant.phone_number
    end

    def fill_submission_details(submission)
      fill_in 'application_submission_cover_letter', with: submission.cover_letter
    end

  end
end

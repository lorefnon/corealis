module Features
  module ApplicationSubmissionHelpers

    def expect_submission_success
      expect(current_path).to eq application_submission_verdict_path(verdict: 'success')
      expect(page).to have_content "Congratulations !"
      expect(page).to have_content "Your application was successfully submitted"
    end

    def expect_duplicate_submission_error
      expect(current_path).to eq application_submission_verdict_path(verdict: 'failure')
      expect(page).to have_content "We are Sorry!"
      expect(page).to have_content "Your application could not be submitted"
      expect(page).to have_content "You have already applied for this position"
    end

    def submit_application(submission)
      fill_applicant_details submission.applicant
      fill_submission_details submission
      click_on 'Submit Application'
    end

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

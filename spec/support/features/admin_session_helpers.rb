module Features
  module AdminSessionHelpers

    def sign_in
      user = create(:admin_user)
      visit new_admin_user_session_path
      fill_in :admin_user_email, with: user.email
      fill_in :password, with: user.password
    end

  end
end

module Features
  module Admin
    module SessionHelpers

      def sign_in(email, password)
        visit new_admin_user_session_url
        fill_in :admin_user_email, with: email
        fill_in :admin_user_password, with: "password"
        click_on 'Login'
      end

      def sign_out
        click_on 'Logout'
      end

      def sign_out_through_url
        visit destroy_admin_user_session
      end

      def ensure_admin_signed_in
        @admin = create(:admin_user)
        sign_in @admin.email, "password"
        @admin
      end

    end
  end
end

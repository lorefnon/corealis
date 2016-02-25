class ApplicationController < ActionController::Base

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def user_for_paper_trail
    user = current_admin_user
    "#{user.class.to_s}:#{user.id}" rescue nil
  end

end

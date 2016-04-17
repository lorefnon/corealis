class ApplicationController < ActionController::Base

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.

  protect_from_forgery with: :exception, prepend: true

  def user_for_paper_trail
    user = current_admin_user
    "#{user.class}:#{user.id}" rescue nil
  end

  def handle_access_violation
    redirect_to root_path, flash: { error: I18n.t('errors.access_violation') }
  end

  def ensure_admin_user
    handle_access_violation unless admin_user
  end

end

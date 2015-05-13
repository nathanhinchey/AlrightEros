class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user, :current_user_has_profile?

  def login!(user)
    @current_user = user
    session[:session_token] = user.sessions.create.session_token
  end

  def current_user
    unless @current_user
      return nil if session[:session_token].nil?
      device = Session.find_by(session_token: session[:session_token])
      return nil if device.nil?
    end

    @current_user ||= User.find(device.user_id)
  end

  def current_user_has_profile?
    return false unless @current_user
    !!@current_user.profile
  end
end

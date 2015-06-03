class ApplicationController < ActionController::Base
  include SessionsHelper

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  respond_to :html, :json

  def user_path(user)
    {
      controller: "#{user.type.underscore.pluralize}/registrations",
      action: :show,
      id: user.id
    }
  end

  def authenticate_user!
    return if logged_in? && current_user.backoffice?

    if !logged_in? || current_user.id != params[:id].to_i
      redirect_to login_path, alert: 'Por favor faça o login.'
    end
  end

  helper_method :user_path
end

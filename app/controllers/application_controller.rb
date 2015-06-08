class ApplicationController < ActionController::Base
  include SessionsHelper

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  respond_to :html, :json

  def authenticate_user!
    return if backoffice?

    if !logged_in? || current_user.id != params[:id].to_i
      redirect_to login_path, alert: 'Por favor faça o login.'
    end
  end

  def authenticate_entity!
    return if backoffice?

    unless logged_in? || current_user.entity?
      redirect_to login_path, alert: 'Por favor faça o login.'
    end
  end
end

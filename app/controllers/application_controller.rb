class ApplicationController < ActionController::Base
  include SessionsHelper

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  respond_to :html, :json, :js

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, alert: I18n.t('flash.forbidden')
  end

  def current_candidate
    return unless current_user.try(:candidate?)

    current_user
  end
end

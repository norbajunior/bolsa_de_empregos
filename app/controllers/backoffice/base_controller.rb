class Backoffice::BaseController < ApplicationController
  layout 'backoffice'

  respond_to :js, :html, only: [:destroy]
  respond_to :html, :json

  before_action :authenticate_backofficer!

  def authenticate_backofficer!
    return if logged_in? && current_user.backoffice?

    redirect_to backoffice_login_path, alert: 'Faça o login como backofficer'
  end
end

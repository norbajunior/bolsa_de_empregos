class Backoffice::SessionsController < Backoffice::BaseController
  skip_before_filter :authenticate_backofficer!, except: :destroy

  layout 'login'

  def new ; end

  def create
    user = User.find_by(email: params[:session][:email].downcase, backoffice: true)

    if user && user.authenticate(params[:session][:password])
      log_in user

      redirect_to backoffice_root_path, notice: 'Login realizado com sucesso'
    else
      flash.now[:alert] = 'Email/password inválidos'

      render 'new'
    end
  end

  def destroy
    log_out if logged_in?

    redirect_to root_path
  end
end

class SessionsController < ApplicationController
  def new ; end

  def create
    user = User.find_by(email: params[:session][:email].downcase)

    if user && user.authenticate(params[:session][:password])
      log_in user

      redirect_to user, notice: 'Logado com sucesso'
    else
      flash.now[:alert] = 'Email/password inválidos'

      render 'new'
    end
  end

  def destroy
    log_out if logged_in?

    redirect_to '/'
  end
end

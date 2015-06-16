class SessionsController < ApplicationController
  def new ; end

  def create
    user = User.find_by(email: params[:session][:email].downcase)

    if user && user.authenticate(params[:session][:password])
      if user.active?
        log_in user ; flash[:notice] = 'Login realizado com sucesso'

        if user.backoffice?
          redirect_to root_path
        else
          redirect_to [:dashboard, user]
        end
      else
        flash.now[:warning] = 'Utilizador inativo'

        render 'new'
      end
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

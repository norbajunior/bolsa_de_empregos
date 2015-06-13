class ForgotPasswordController < ApplicationController
  def new
  end

  def edit
    @user = User.find_by password_reset_token: params[:token]

    if @user.nil?
      flash[:alert] = 'Não foi possível prosseguir com a redefinição da senha. Tente o processo novamente'

      redirect_to new_forgot_password_path
    end
  end

  def create
    @user = User.find_by email: params[:user][:email]

    if @user
      @user.generate_password_reset_token!

      Password.reset(@user).deliver

      flash[:notice] = 'Um email para poderes redefinir sua senha foi te enviado'

      redirect_to login_path
    else
      flash.now[:alert] = 'Não foi possível encontrar o email informado'

      render 'new'
    end
  end

  def update
    @user = User.find_by password_reset_token: user_params[:password_reset_token]

    if @user
      if @user.update(user_params.merge(password_reset_token: nil))
        flash[:notice] = 'Sua senha foi redefinida com sucesso'
      end

      respond_with @user, location: login_path
    else
      flash[:alert] = 'Inválido'

      render 'edit'
    end
  end

  private

  def user_params
    params.require(:user).permit(:password_reset_token, :password, :password_confirmation)
  end
end

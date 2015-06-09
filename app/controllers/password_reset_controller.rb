class PasswordResetController < ApplicationController
  authorize_resource class: false

  def edit ; end

  def update
    user = current_user

    if user.authenticate(password_params[:current_password])
      if user.update(password_params.except(:current_password))
        log_out

        flash[:notice] = I18n.t('flash.password_reset')
      end
    else
      user.errors.add(:current_password, :invalid)
    end

    respond_with user, location: login_path
  end

  private

  def password_params
    params.require(current_user.type.underscore.to_sym).
    permit(:current_password, :password, :password_confirmation)
  end
end

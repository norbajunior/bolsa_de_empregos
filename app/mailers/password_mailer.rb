class PasswordMailer < ActionMailer::Base
  default from: "backoffice@bolsademprego.pt"

  def reset(user)
    @user, @url = user, edit_forgot_password_url(user.password_reset_token)

    mail to: @user.email, subject: 'Redefinição de senha (Bolsa de Emprego)'
  end
end

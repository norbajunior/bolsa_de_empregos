class Password < ActionMailer::Base
  default from: "no-reply@bolsademprego.pt"

  def reset(user)
    @user, @url = user, edit_forgot_password_url(user.password_reset_token)

    mail to: @user.email, subject: 'Redefinição de senha (Bolsa de Emprego)'
  end
end

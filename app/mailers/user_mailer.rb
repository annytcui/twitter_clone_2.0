class UserMailer < ApplicationMailer

  def account_activations(user)
    @user = user
    mail to: user.email, subject: "Activate Your Account - TRAILS Demo App"
  end

  def password_reset(user)
    @user = user
    mail to: user.email, subject: "Reset Your Password - TRAILS Demo App"
  end
end

class UserMailer < ApplicationMailer

  def account_activation(user)
    @user = user
    mail to: user.email, subject: "Activate Your Account - Twitter Clone 2.0"
  end

  def password_reset(user)
    @user = user
    mail to: user.email, subject: "Reset Your Password - Twitter Clone 2.0"
  end
end

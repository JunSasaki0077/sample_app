class UserMailer < ApplicationMailer


  def account_activation(user)
    @user = user
    mail to: user.email, subject: "Account activation"
    # => return: mail object (text/html)
    #   example: mail.deliver_later 
  end


  def password_reset(user)
    @user = user
    mail to: user.email, subject: "Password reset"
  end
end

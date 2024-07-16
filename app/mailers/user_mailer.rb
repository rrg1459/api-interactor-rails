class UserMailer < ApplicationMailer
  default from: 'DRIWLER <info@driwler.com>'

  def welcome_mail(user)
    @user = user
    mail(to: @user.email, subject: 'Bienvenido a los juegos del hambre')
  end

  def campaign_mail(user)
    @user = user
    mail(to: @user.email, subject: 'Campaña de los juegos del hambre')
  end

end

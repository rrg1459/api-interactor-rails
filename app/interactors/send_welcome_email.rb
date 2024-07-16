class SendWelcomeEmail
  include Interactor

  def call
    UserMailer.welcome_mail(context.user).deliver_now
  end

end

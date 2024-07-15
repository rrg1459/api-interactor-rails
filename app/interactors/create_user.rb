class CreateUser
  include Interactor

  def call

    context.fail!(error: Constants::EMAIL_ERROR) unless context[:email] =~ Constants::EMAIL_REGEX
    context.fail!(error: Constants::NAME_ERROR) if context[:name].nil?
    context.fail!(error: Constants::AGE_ERROR) if Time.now.year - context[:borned_at][0..3].to_i < 18

    user = User.create(
      email: context[:email],
      password: context[:password],
      password_confirmation: context[:password_confirmation],
      name: context[:name],
      borned_at: context[:borned_at]
    )

    context.fail!(error: Constants::USER_INVALID) unless user.valid?

    context.user = user
    UserMailer.welcome_mail(user).deliver_now

  end

end

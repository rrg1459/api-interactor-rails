class CreateUser
  include Interactor

  before do
    context.fail!(error: Constants::EMAIL_ERROR) unless context[:email] =~ Constants::EMAIL_REGEX
    context.fail!(error: Constants::NAME_ERROR) if context[:name].nil?
    context.fail!(error: Constants::AGE_ERROR) if Time.now.year - context[:borned_at][0..3].to_i < 18
  end

  def call
    user = User.create(user_context)
    context.fail!(error: Constants::USER_INVALID) unless user.valid?
    context.user = user
  end

  private

    def user_context
      context.to_h.slice(:email, :password, :password_confirmation, :name, :borned_at)
    end

end

class Api::V1::RegistrationsController < Devise::RegistrationsController
  before_action :ensure_params_exist, only: :create

  # Sign up
  def create
    user = User.new(user_params)

    
    # byebug
    # https://medium.com/@lucaspolonuer/ruby-on-rails-boost-your-software-design-skills-with-interactors-e07f1f9a711e
    
    return render_name_error if user.name.nil?
    return render_age_error if Time.now.year - user.borned_at.year < 18

    if user.save

      UserMailer.welcome_mail(user).deliver_now

      json_response "Signed Up Succesfully", true, { user: user }, :ok
    else
      json_response "Something wrong", false, {}, :unprocessable_entity
    end
  end

  def render_name_error
    json_response "Missing name", false, {}, :unprocessable_entity
  end

  def render_age_error
    json_response "Too young", false, {}, :unprocessable_entity
  end
  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :name, :borned_at)
  end

  def ensure_params_exist
    return if params[:user].present?
    json_response "Missing params", false, {}, :bad_request
  end
end
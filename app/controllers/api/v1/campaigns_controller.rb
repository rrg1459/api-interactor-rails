class Api::V1::CampaignsController < Devise::RegistrationsController
  before_action :ensure_params_exist, only: :create

  # Sign up
  def create
    result = CampaignSignUpUser.call(user_params)
    return render status: :unprocessable_entity, json: result.error unless result.success?
    json_response "Signed Up Succesfully", true, { user: result.user }, :ok
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
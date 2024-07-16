class SendCampaignEmail
  include Interactor

  def call
    UserMailer.campaign_mail(context.user).deliver_now
  end

end

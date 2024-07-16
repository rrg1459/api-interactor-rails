class CampaignSignUpUser
  include Interactor::Organizer

  organize CreateUser, SendCampaignEmail
end
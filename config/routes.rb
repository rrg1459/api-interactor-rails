Rails.application.routes.draw do

  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?

  devise_for :users

  namespace :api, defaults: {format: :json} do
    namespace :v1 do
      devise_scope :user do
        post "campaign_sign_up", to: "campaigns#create"
        post "sign_up", to: "registrations#create"
        post "sign_in", to: "sessions#create"
        post "log_out", to: "sessions#destroy"
      end
    end
  end
end

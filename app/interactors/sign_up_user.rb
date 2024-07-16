class SignUpUser
  include Interactor::Organizer

  organize CreateUser, SendWelcomeEmail
end
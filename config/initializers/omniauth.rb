Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, AppSettings[:omniauth_twitter_id], AppSettings[:omniauth_twitter_secret]
  provider :facebook, AppSettings[:omniauth_facebook_id], AppSettings[:omniauth_facebook_secret]
  provider :google_oauth2, AppSettings[:omniauth_google_id], AppSettings[:omniauth_google_secret]
  #provider :linkedin, AppSettings[:omniauth_linked_id], AppSettings[:omniauth_linked_secret]
end
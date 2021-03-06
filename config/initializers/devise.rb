Devise.setup do |config|
  config.mailer_sender = 'please-change-me-at-config-initializers-devise@example.com'

  require 'devise/orm/active_record'
  config.case_insensitive_keys = [:email]
  config.strip_whitespace_keys = [:email]
  config.skip_session_storage = [:http_auth]
  config.stretches = Rails.env.test? ? 1 : 10
  config.reconfirmable = true
  config.expire_all_remember_me_on_sign_out = true
  config.password_length = 8..72
  config.reset_password_within = 6.hours
  config.sign_out_via = :delete

  # Omniauth Apps
    config.omniauth :linkedin, "77akb2wzj4892u", "UyDX9D2tUauWCM5R"
    config.omniauth :facebook, "903602109748933", "fd56bde9dcd9a4e18c88f4c111cd46d1"
end

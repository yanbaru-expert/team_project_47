
Devise.setup do |config|

  config.mailer_sender = 'タイトル名 <noreply@example.com>'

  require 'devise/orm/active_record'

  config.reconfirmable = true

  config.expire_all_remember_me_on_sign_out = true

  config.password_length = 6..128

  config.email_regexp = /\A[^@\s]+@[^@\s]+\z/

  config.reset_password_within = 6.hours

  config.sign_out_via = :delete

end

# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
ShoeShop::Application.initialize!


ActionMailer::Base.smtp_settings = {
  :user_name => ENV['SENDGRIDUSERNAME'],
  :password => ENV['SENDGRIDPASSWORD'],
  :domain => 'www.solesout.com',
  :address => 'smtp.sendgrid.net',
  :port => 587,
  :authentication => :plain,
  :enable_starttls_auto => true
}






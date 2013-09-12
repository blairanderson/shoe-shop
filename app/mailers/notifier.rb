class Notifier < ActionMailer::Base
  include SendGrid
  default :from => 'jonas@solesout.com'

  # send a signup email to the user
  # pass in the user object that contains the user's email address

  def signup_email(user)
    @user = user
    @logo_url = 
    mail( :to => user.email, :subject => 'Thanks for signing up' )
  end

  # Deliver the signup_email
    # Notifier.signup_email(@user).deliver
end


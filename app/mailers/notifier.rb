class Notifier < ActionMailer::Base
  include SendGrid
  default :from => 'jonas@solesout.com'

  # send a signup email to the user
  # pass in the user object that contains the user's email address

  def signup_email(user)
    attachments.inline['logo-black.png'] = File.read('app/assets/images/logo-black.png')
    @user = user
    mail( :to => user.email, :subject => 'Thanks for signing up' )
  end

end


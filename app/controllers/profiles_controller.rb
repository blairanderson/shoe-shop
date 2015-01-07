class ProfilesController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = current_user
  end

  def update
    @user = current_user
    
    if @user.update(profile_params)
      redirect_to profile_path, notice: 'Successfully updated.'
    else
      errors = @user.errors.full_messages.join("<br/>")
      redirect_to profile_path, alert: errors.html_safe
    end
  end

  def remove_twitter_authentication
    @user = current_user
    message = @user.remove_twitter_authentication ? "Twitter Unlinked" : "Sorry, something went wrong"
    redirect_to profile_path, notice: message
  end

  def profile_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end

end

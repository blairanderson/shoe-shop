class ProfilesController < ApplicationController
  before_action :require_login

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

  def profile_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end

end

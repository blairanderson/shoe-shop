class ProfilesController < ApplicationController
  before_action :require_login

  def show
    @user = User.with_posts.where(id: current_user.id).first
  end

  def update
    @user = current_user
    if @user.update(profile_params)
      render action: :show, notice: 'Successfully updated.'
    else
      render action: :show, alert: 'Sorry, Something Went Wrong'
    end

  end

  def profile_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end

end

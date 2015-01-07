class SessionsController < ApplicationController

  def new
    @user = User.new
  end
  
  def create
    if @user = login(user_params[:username].downcase ,user_params[:password])
      redirect_back_or_to(root_path, :notice => 'Login successful.')
    else
      redirect_to login_path, notice: "Login Failed. Try Again."
    end
  end

  def twitter_auth
    if current_user
      if current_user.update_omniauth env['omniauth.auth']
        redirect_to new_post_path, notice: "Twitter Approved: @#{current_user.twitter}. Create your first pair!"
      else
        redirect_to root_path, notice: "Error with your Twitter Account. Try Again."
      end
    else
      redirect_to new_user_path, notice: "Must Have an Account!"
    end
  end
    
  def destroy
    logout
    redirect_to root_path, notice: 'Logged out!'
  end

  private
  def user_params
    params.require(:user).permit(:password, :username)
  end
end

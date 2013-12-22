class SessionsController < ApplicationController

  def new
    @user = User.new
  end
  
  def create
    if @user = login(user_params[:username].downcase ,user_params[:password])
      redirect_back_or_to(root_path, :notice => 'Login successful.')
    else
      flash[:alert] = "Login Failed. Try Again."
      redirect_to login_path
    end
  end

  def twitter_auth
    if current_user
      if current_user.update_omniauth env['omniauth.auth']
        redirect_to root_path, notice: "Twitter Approved: @#{current_user.twitter}"
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

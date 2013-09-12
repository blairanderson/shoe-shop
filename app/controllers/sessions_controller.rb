class SessionsController < ApplicationController

  def new
    @user = User.new
  end
  
  def create
    if @user = login(user_params[:username].downcase ,user_params[:password])
      redirect_back_or_to(root_path, :notice => 'Login successful.')
    else
      flash[:alert] = "Login Failed."
      redirect_to login_path
    end
  end
    
  def destroy
    logout
    redirect_to(root_path, :notice => 'Logged out!')
  end

  private
  def user_params
    params.require(:user).permit(:password, :username)
  end
end

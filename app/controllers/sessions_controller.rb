class SessionsController < ApplicationController

  def new
    @user = User.new
  end
  
  def create
    if @user = login(params[:username].downcase ,params[:password])
      redirect_back_or_to(root_path, :notice => 'Login successful.')
    else
      flash[:alert] = "Login Failed."
      redirect_to new_sessions_path
    end
  end
    
  def destroy
    logout
    redirect_to(root_path, :notice => 'Logged out!')
  end
end

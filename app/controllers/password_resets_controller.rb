class PasswordResetsController < ApplicationController
  skip_before_filter :require_login

  def create 
    @user = User.find_by_email(params[:email])

    if @user
      @user.deliver_reset_password_instructions!
      redirect_to login_path, notice: 'Instructions have been sent to your email.'
    else
      redirect_to new_user_path, notice: "Cannot Find Email #{params[:email]}"
    end
  end

  def edit
    @user = User.load_from_reset_password_token(params[:id])
    @token = params[:id]

    if @user.blank?
      not_authenticated
      return
    end
  end

  def update
    @token = params[:token]
    @user = User.load_from_reset_password_token(params[:token])

    if @user.blank?
      not_authenticated
      return
    end

    @user.password_confirmation = params[:user][:password_confirmation]
    if @user.change_password!(params[:user][:password])
      auto_login(@user)
      redirect_to profile_path, :notice => 'Password was successfully updated.'
    else
      render :action => "edit"
    end
  end
end
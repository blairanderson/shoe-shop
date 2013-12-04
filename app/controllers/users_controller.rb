class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :require_login, only: [:edit, :update, :destroy, :profile]

  def new
    @user = User.new
  end

  def show
  end

  def profile
    @user = current_user
    render :show
  end

  def create
    @user = User.new(user_params)

    if @user.save
      auto_login(@user)
      Notifier.signup_email(@user).deliver
      render 'create'
    else
      render :action => "new", notice: "Sorry There Were Errors"
    end
  end

  def edit
    unless current_user == @user
      redirect_to root_path, notice: "Wrong Profile"
    end
  end

  def update
    unless current_user == @user
      redirect_to root_path, notice: "Wrong Profile"
    end
    if @user.update(user_params)
      redirect_to root_path, notice: 'Successfully updated.'
    else
      render action: 'edit'
    end
  end

private
  def set_user
    @user = User.where(id: params[:id]).first
    unless @user
      redirect_to root_path, notice: "User Does Not Exist"
      return
    end
  end

  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end
end

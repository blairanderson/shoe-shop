class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :require_login, only: [:edit, :update, :destroy]
  before_action :require_current_owner, only: [:edit, :update]


  def new
    @user = User.new
  end

  def show
  end

  def create
    @user = User.new(user_params)

    if @user.save
      auto_login(@user)
      Notifier.signup_email(@user).deliver
      redirect_to new_post_path
    else
      render :action => "new", notice: "Sorry There Were Errors"
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      render action: :edit, notice: 'Successfully updated.'
    else
      render action: :edit
    end
  end

private

  def require_current_owner
    Authorization.before(self)
  end

  def set_user
    @user = User.with_posts.where(id: params[:id]).first
    unless @user
      redirect_to '/pairs/top/all', notice: "User Does Not Exist"
      return
    end
  end

  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end

end

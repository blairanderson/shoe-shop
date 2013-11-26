class AdminController < ApplicationController
  before_action :require_admin
  before_action :set_user, only: [:reset_user_password]

  def users_index
    @users = User.order('created_at DESC')
  end

  def reset_user_password
    @user.update(password: 'password', password_confirmation: 'password')
    redirect_to users_index_path, notice: "#{@user.username}| #{@user.email} reset to 'password'"
  end

private
  def set_user
    @user = User.find(params[:id])
  end
end
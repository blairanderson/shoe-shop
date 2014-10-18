class Admin::UsersController < AdminController
  before_action :set_user, only: [:update]
  def index
    @users = User.order('created_at DESC')
    respond_to do |format|
      format.html
      format.csv { render text: @users.to_csv }
    end
  end

  def update
    if @user.id == current_user.id
      redirect_to admin_users_path, notice: "Cannot reset your own password in here."
    else
      @user.update( user_params.slice(:password, :password_confirmation) )
      redirect_to admin_users_path, notice: "#{@user.username}| #{@user.email} reset to 'password'"
    end
  end

private
  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:password, :password_confirmation)
  end
end
class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :exception
  rescue_from CurrentOwnerError, with: :user_not_authorized

  helper_method :current_admin, :post_owner?, :mobile_device?

  def post_owner?
    current_user && @post && current_user.id == @post.user_id
  end

  def mobile_device?
    request.user_agent =~ /Mobile|webOS/
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:username, :email, :password, :password_confirmation, :remember_me) }
    devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:login, :username, :email, :password, :remember_me) }
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:username, :email, :password, :password_confirmation, :current_password) }
  end


  # TODO create a NOTICE for people to use twitter
  # before_action :include_popups
  # def include_popups
  #   @notifications = []
  #   if current_user && current_user.keychain.nil?
  #     @notifications << "twitter"
  #   end
  # end

  def require_post_ownership
    unless post_owner?
      redirect_to new_sessions_path, notice: "You are not authorized"
    end
  end

  def require_comment_ownership
    unless current_user && current_user.id == @comment.user_id
      redirect_to new_sessions_path, notice: "You are not authorized"
    end
  end

  def current_admin
    begin
      if current_user && admin_user?
        @current_admin = current_user
      end
    rescue
      redirect_to logout_path
      return
    end
  end

  def require_admin
    unless logged_in? && admin_user?
      redirect_to root_path, notice: "Unauthorized Access"
      return
    end
  end

  def admin_user?
    current_user == adminj || current_user == adminb
  end

  private
  def adminj
    User.where(email: ENV['ADMINJ']).first
  end

  def adminb
    User.where(email: ENV['ADMINB']).first
  end

  def redirect_path
    profile_path
  end

  def user_not_authorized
    redirect_to profile_path, alert: "You don't have access to that section."
  end
end

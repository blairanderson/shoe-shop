class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  rescue_from CurrentOwnerError, with: :user_not_authorized

  before_action :include_popups

  helper_method :current_admin, :current_owner

  def current_owner
    current_user && @user && current_user.id == @user.id    
  end

  def mobile_device?
    request.user_agent =~ /Mobile|webOS/
  end
  helper_method :mobile_device?

  def include_popups
    @notifications = []
    @notifications << "alert"  if alert
    @notifications << "notice" if notice
    if current_user && current_user.keychain.nil?
      @notifications << "twitter"
    end
  end

  def redirect_path
    session[:return_to_url] || login_path
  end

  def require_login
    if !logged_in?
      session[:return_to_url] = request.url if request.get?
      redirect_to login_path, notice: "Login or Create Account"
      return
    end
  end

  def require_post_ownership
    unless current_user && current_user.id == @post.user_id
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

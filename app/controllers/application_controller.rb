class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_admin

  before_action :include_popups

  def include_popups
    @notifications = []
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

end

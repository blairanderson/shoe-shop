class BlogPostsController < ApplicationController
  layout 'blog_application'

  def index
    @blog_posts = BlogPost.all
  end

  def show
    @blog_post = BlogPost.where(id: params[:id]).first
  end

  def webhook
    # eventually need to block things with an improper token
    # params[:token] == Rails.config.webhook_token

    payload = params[:payload]
    @user = User.find_by_email(payload[:user][:email])
    if @user
      service = BlogPostWebHook.new(payload)
      service.include_user(@user)
      head :ok
    else
      head :unprocessable_entity
    end
  end

end
class BlogPostsController < ApplicationController

  def webhook
    # eventually need to block things with an improper token
    # params[:token] == Rails.config.webhook_token

    payload = params[:payload]
    @user = User.find_by_email(payload[:user][:email])
    if @user
      service = BlogPostWebHook.new(payload)
      service.include_user(@user)
      service.do_work
      head :ok
    else
      head :unprocessable_entity
    end
  end

end
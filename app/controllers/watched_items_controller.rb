class WatchedItemsController < ApplicationController
  before_action :require_login
  before_action :set_post, except: [:index]
  before_action :set_user

  def index
    @watched_items = @user.watched_items.includes(post: [:size, :user])
  end

  def create
    @watched_item = WatchedItem.new(watching_params)

    if @watched_item.save
      redirect_to :back, notice: "Now Watching"
    else
      redirect_to :back, notice: "#{@watched_item.errors.messages[:user_id].join}"
    end
  end

  def destroy
    item = WatchedItem.find(params[:id])
    item.destroy
    redirect_to :back, notice: "No Longer Watching"
  end

private

  def set_post
    @post = Post.find(params[:post_id])
  end

  def set_user
    @user = current_user
  end

  def watching_params
    valid = params.permit(:user_id, :post_id)
    valid[:post_id] = @post.id
    valid[:user_id] = @user.id
    valid
  end
end

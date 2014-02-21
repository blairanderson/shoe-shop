class Admin::PostsController < AdminController
  before_action :set_post, only: [:destroy]

  def index
    @posts = Post.order(created_at: :desc).includes(:user, :size).page(params[:page])
  end

  def destroy
    @post.destroy!
    redirect_to admin_posts_path, notice: "post #{@post.id} deleted"
  end

private
  def set_post
    @post = Post.find(params[:id])
  end
end
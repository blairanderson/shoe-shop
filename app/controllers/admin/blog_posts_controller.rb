class Admin::BlogPostsController < AdminController
  before_action :set_blog_post, only: [:destroy]

  def index
    @blog_posts = BlogPost.order(created_at: :desc).page(params[:page])
  end

  def destroy
    @blog_post.destroy!
    redirect_to admin_blog_posts_path, notice: "blog_post #{@blog_post.id} deleted"
  end

private
  def set_blog_post
    @blog_post = BlogPost.find(params[:id])
  end
end
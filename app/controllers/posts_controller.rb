class PostsController < ApplicationController
  before_action :set_post, except: [:new, :create, :index]
  before_action :require_login, except: [:show, :index]
  before_action :require_post_ownership, only: [:edit, :update, :destroy]

  def show
    impressionist(@post)
    @images = @post.images
    @profile = ProfilePresenter.new(@post.user)
  end

  def index
    @posts = Post.order("cached_votes_score DESC")
  end

  def new
    @post = Post.new
  end


  def upvote
    @post.liked_by current_user
    redirect_to :back, notice: "upvote :)"
  end

  def downvote
    @post.downvote_from current_user
    redirect_to :back, notice: "downvote :("
  end

  def create
    @post = current_user.posts.build(post_params)

    if @post.save
      @post.liked_by current_user
      redirect_to @post, notice: 'Post was successfully created.'
    else
      render action: 'new'
    end
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to @post, notice: 'Post was successfully updated.'
    else
      render action: 'edit'
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_url, notice: 'Post was successfully destroyed.'
  end

private
  # Use callbacks to share common setup or constraints between actions.
  def set_post
    @post = Post.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def post_params
    params.require(:post).permit(:brand, :title, :size_id, :price, :body)
  end
end

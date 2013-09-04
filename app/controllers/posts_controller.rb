class PostsController < ApplicationController
  before_action :set_post, except: [:new, :create, :index]
  before_action :require_login, except: [:show, :index, :callback]
  before_action :require_post_ownership, only: [:edit, :update, :destroy]
  skip_before_filter :verify_authenticity_token, only: [:callback]

  def show
    impressionist(@post)
    @images = @post.images
    @profile = ProfilePresenter.new(@post.user)
  end

  def index
    @posts = Post.active.order("cached_votes_score DESC")
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

  def callback
    @paypay = PaypalCallback.create(response: callback_params)
    render nothing: true
  end

  def callback_params
    params.permit(
      :id,
      :payer_status,:payment_status,:payment_date,:verify_sign,:item_name,
      :first_name,:last_name,
      :address_name,:address_street,:address_city,:address_zip,:address_state,:address_country,:address_status,
      :receiver_email,:receiver_id,:business,:payer_email)
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
  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:brand, :title, :size_id, :price, :body, :status_enum)
  end
end

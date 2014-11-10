class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post, only: [:create]
  before_action :set_comment, only: [:edit, :update]
  before_action :require_comment_ownership, only: [:edit, :update]

  def create
    validate_comment
    @comment = current_user.comments.build(@comment_params)

    if @comment.save
      redirect_to post_path(@post), notice: "Comment Added"
    else
      redirect_to :back, notice: "Sorry, There was an Error."
    end
  end

  def edit
  end

  def update
    if @comment.update(comment_params)
      redirect_to post_path(@comment.post), notice: "updated"
    else
      flash[:notice] = "Please Try Again:)"
      render :edit
    end
  end

private

  def require_comment_ownership
    unless current_user && current_user.id == @comment.user_id
      redirect_to root_path, notice: "You are not authorized"
    end
  end

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def set_post
    @post = Post.find(params[:post_id])
  end

  def validate_comment
    @comment_params = comment_params
    @comment_params[:post_id] = @post.id
  end

  def comment_params
    params.require(:comment).permit(:body, :user_id, :post_id)
  end
end

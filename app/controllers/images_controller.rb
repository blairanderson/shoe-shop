class ImagesController < ApplicationController
  before_action :set_post, only: [:create]
  before_action :set_image, only: [:destroy]
  before_action :require_post_ownership, only: [:create]
  before_action :require_image_ownership, only: [:destroy]
  

  def create
    @image = @post.images.build(image_params)

    if @image.save
      respond_to do |format|
        format.json { render :json => @image, :status => :created, :location => @image }
        format.html { redirect_to @image, notice: 'Image was successfully created.' }
      end
    end
  end

  def destroy
    @image.destroy
    redirect_to post_path(@image.post), notice: "Photo Deleted"
  end

  private
    def set_image
      @image = Image.find(params[:id])
    end

    def set_post
      @post = Post.find(params[:post_id])
    end

    def image_params
      params.require(:image).permit(:url)
    end

    def require_image_ownership
      unless (current_user && current_user.id == @image.post.user_id) || current_admin
        redirect_to new_sessions_path, notice: "You are not authorized"
      end
    end
end

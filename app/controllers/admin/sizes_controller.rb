class Admin::SizesController < ApplicationController
  before_action :require_admin

  def index
    @sizes = Size.all
  end

  def show
    @size = Size.find(params[:id])
  end

  def create
    @size = Size.new(size_params)

    if @size.save
      redirect_to admin_sizes_path, notice: "Size #{@size.name} Created..."
    else
      render :index, notice: "There was an error"
    end
  end

  def size_params
    params.require(:size).permit(:name)
  end

  def destroy
    @size = Size.find(params[:id])
    @size.destroy
    redirect_to admin_sizes_path, notice: "Size #{@size.name} destroyed..."
  end

end

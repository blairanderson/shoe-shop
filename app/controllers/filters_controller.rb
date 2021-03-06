class FiltersController < ApplicationController
  before_action :validate_filter, :validate_sort

  def index
    status = session[:post_status_filter] || :active
    @posts = Post.send(status).filter(@filter).sort(@sort).includes(:user, :images).page(params[:page])
  end

  def sold
    @posts = Post.inactive.filter(@filter).sort(@sort).includes(:user, :size).page(params[:page])
    render :index
  end

  def toggle
    if session[:posts_filter] == :active
      session[:posts_filter] = :inactive
    else
      session[:posts_filter] = :active
    end
    redirect_to :back
  end

private


  def filter_params
    params.permit(:filter, :sort)[:filter]
  end

  def sort_params
    params.permit(:filter, :sort)[:sort]
  end

  def validate_sort
    if valid_sorts.keys.include?(sort_params)
      @sort = sort_params.to_sym
      @valid_sorts = valid_sorts
    else
      redirect_to root_path, notice: "that sort does not exist"
    end
  end

  def valid_sorts
    {
      'top' => 'top',
      'bottom' => 'bottom',
      'newest' => 'newest',
      'random' => 'random',
      'oldest' => 'oldest'
    }
  end

  def validate_filter
    if valid_filters.keys.include?(filter_params)
      @filter = filter_params.to_sym
      @valid_filters = valid_filters
    else
      redirect_to root_path, notice: "that filter does not exist"
    end
  end

  def valid_filters
    {
      'all' => 'all',
      'sml' => '9-',
      'med' => '9.5-10',
      'lrg' => '10.5-11', 
      'xl' => '11.5+'
    }
  end
end

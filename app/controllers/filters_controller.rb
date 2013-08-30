class FiltersController < ApplicationController
  before_action :validate_filter, :validate_sort
  
  def index
    @posts = Post.active.filter(@filter).sort(@sort)
  end

  def sold
    @posts = Post.inactive.filter(@filter).sort(@sort)
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

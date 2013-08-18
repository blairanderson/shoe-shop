class FiltersController < ApplicationController
  before_action :filter_params
  
  def top
    @posts = Post.filter(@filter).top
  end

  def bottom
    @posts = Post.filter(@filter).bottom
  end

  def newest
    @posts = Post.filter(@filter).newest
  end

  def oldest
    @posts = Post.filter(@filter).oldest
  end

private
  def filter_params
    filter = params.permit(:filter)[:filter]
    if valid_values.keys.include?(filter)
      @filter = filter.to_sym
      @valid_filters = valid_values
    else
      redirect_to root_path, notice: "that filter does not exist"
    end
  end

  def valid_values
    {
      'all' => 'all',
      'sml' => '9-',
      'med' => '9.5-10',
      'lrg' => '10.5-11', 
      'xl' => '11.5+'
    }
  end
end

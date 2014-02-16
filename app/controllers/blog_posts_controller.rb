class BlogPostsController < ApplicationController

  def webhook
    puts params
    render nothing: true
  end
end
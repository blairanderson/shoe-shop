class PagesController < ApplicationController
  def sitemap
    @posts = Post.all
    @users = User.all
    @comments = Comment.all
  end
end

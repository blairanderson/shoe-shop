module PostsHelper

  def post_title(post)
    "#{post.title}, size: #{post.size.name} #{number_to_currency(post.price, precision: 0)} SHIPPED"
  end

  def verbose_post_title(post)
    "For Sale: #{ post_title(post) } #{post_url(post)} | #solesout"
  end

  def search_query
    if params && params[:search] && params[:search][:query]
      "Search: #{params[:search][:query]}"
    else
      "Search"
    end
  end

  def remote_options
    if logged_in?
      {remote: true, disable_with: 'x'}
    else 
      {}
    end
  end
end

module PostsHelper

  def post_title(post)
    "#{post.brand} #{post.title}, size: #{post.size.name} #{number_to_currency(post.price, precision: 0)} SHIPPED"
  end

  def verbose_post_title(post)
    "For Sale: #{ post_title(post) } #{post_url(post)} | Please RT"
  end
end

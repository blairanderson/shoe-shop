module PostsHelper

  def post_title(post)
    "#{post.brand} #{post.title}, size: #{post.size.name} #{number_to_currency(post.price, precision: 0)}"
  end

  def verbose_post_title(post)
    "For Sale: #{post.brand} #{post.title}, size: #{post.size.name} #{number_to_currency(post.price, precision: 0)} SHIPPED #{post_url(post.id)} | Please RT"
  end
end

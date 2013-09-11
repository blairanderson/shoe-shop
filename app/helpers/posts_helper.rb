module PostsHelper

  def post_title(post)
    "#{post.brand} #{post.title}, size: #{post.size.name} #{number_to_currency(post.price, precision: 0)}"
  end
end

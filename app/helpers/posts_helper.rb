module PostsHelper

  def post_title(post)
    "#{post.title}, size: #{post.size.name} #{number_to_currency(post.price, precision: 0)} SHIPPED"
  end

  def verbose_post_title(post)
    "For Sale: #{ post_title(post) } #{post_url(post)} | #solesout"
  end

  def search_query
    params[:search] ? params[:search][:query] : nil
  end

  def remote_options
    if current_user
      {remote: true, disable_with: 'x'}
    else 
      {}
    end
  end

  def status_to_class(status)
    {
        for_sale: "success",
        draft: "info",
        sold: "danger disabled",
        deleted: "danger"
    }[status]
  end
end

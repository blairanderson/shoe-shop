module ApplicationHelper
  def site_title
    "SolesOut"
  end

  def header(content)
    content_for :title, content
  end

  def robots
    instructions = {
      'users' => 'noindex',
      'filters' => 'noindex',
      'posts' => 'index'
    }[params[:controller]] || 'noindex'
    tag :meta, content: instructions, property: 'st:robots'
  end

  def white_logo
    image_tag("solesout-small.png", size: "100")
  end

  def blog_helper_url
    begin
      "http://www.solesout.com#{Monologue::Post.last.posts_revisions.last.full_url}"
    rescue Exception => e
      "http://www.solesout.com/"
    end
  end

  def admin_counts
    {
      users: user_count,
      twitter_users: tweeps_count,
      posts: post_count,
      dollars: dollar_count,
      images: image_count
    }
  end

  def user_count
    User.count
  end

  def post_count
    Post.count
  end

  def dollar_count
    Post.sum('price')
  end

  def image_count
    Image.count    
  end

  def tweeps_count
    Keychain.count
  end
end

class Statistics
  def self.load
    stats = self.new
    {
        posts: stats.posts,
        images: stats.images,
        user: stats.users,
        twitter_users: stats.twitter_users,
        dollars_active: stats.dollars_active,
        dollars_sold: stats.dollars_sold
    }
  end

  def users
    @users ||= User.count
  end

  def posts
    @posts ||= Post.count
  end

  def dollars_active
    @dollars_active ||= Post.active.sum('price')
  end

  def dollars_sold
    @dollars_sold ||= PaypalCallback.pluck(:payment_gross).compact.map(&:to_i).reduce(:+)
  end

  def images
    @images ||= Image.count
  end

  def twitter_users
    @twitter_users ||= Keychain.count
  end
end
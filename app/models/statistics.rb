class Statistics
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

  def image_count
    @images ||= Image.count
  end

  def twitter_users
    @twitter_users ||= Keychain.count
  end
end
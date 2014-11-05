class Search
  def self.for(query)
    find_products( query )
  end

  def self.find_products(query)
    posts = all_posts
    posts = posts.where("title ILIKE ?", "%#{query}%") if query.present?
    posts.includes(:user, :images).take(28)
  end

  def self.all_posts
    Post.active.order(cached_votes_score: :desc, created_at: :desc)
  end
end 
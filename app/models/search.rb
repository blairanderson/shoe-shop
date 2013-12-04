class Search
  def self.for(search)
    search.present? ? find_products( search[:query] ) : all_posts
  end

  def self.find_products(query)
    posts = all_posts
    posts = posts.where("title like ?", "%#{query}%") if query.present?
    posts
  end

  def self.all_posts
    Post.active.order(cached_votes_score: :desc, created_at: :desc)
  end
end 
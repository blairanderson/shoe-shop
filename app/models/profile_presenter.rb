class ProfilePresenter
  attr_reader  :user, :id, :username, :posts, :upvotes, :downvotes, :score

  def initialize(user)
    @user = user
    @id = user.id
    @username = user.username
    @posts = user.posts
  end

  def upvotes
    @upvotes ||= posts.sum('cached_votes_up')
  end

  def downvotes
    @downvotes ||= posts.sum('cached_votes_down')
  end

  def score
    @score ||= posts.sum('cached_votes_score')
  end

  def views
    @vies ||= posts.sum('impressions_count')
  end

  def influence
    @influence ||= ( (views + score + upvotes) ) 
  end

  def self.find(user_id = nil)
    user = User.where(id: user_id).first
    if user
      self.new(user)
    else
      nil
    end
  end

end

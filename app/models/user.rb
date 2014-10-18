class User < ActiveRecord::Base
  authenticates_with_sorcery!
  acts_as_voter
  scope :with_posts, -> { includes(posts: [:size, :user]) }

  validates_presence_of :username
  validates_uniqueness_of :username, case_sensitive: false
  validates_length_of :username, minimum: 5
  validates_format_of :username, with: /\A[a-z0-9_\-]*\z/i

  validates_length_of :password, minimum: 5, if: :password
  validates_confirmation_of :password

  validates_presence_of :email
  validates_uniqueness_of :email, case_sensitive: false

  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :watched_items, dependent: :destroy
  has_many :watched_posts, through: :watched_items, source: :post
  has_many :blog_posts, dependent: :destroy
  has_one :keychain, dependent: :destroy

  def self.to_csv
    CSV.generate do |csv|
      # headers
      csv << %w(name email twitter posts_count score created_at)
      all.each do |user|
        csv << [
            user.username,
            user.email,
            user.twitter,
            user.posts.count,
            user.score,
            user.created_at.to_i
        ]
      end
    end
  end

  def watching?(post)
    if watching(post)
      true
    else
      false
    end
  end

  def update_omniauth(auth)
    self.tap do |user|
      user.provider = auth["provider"]
      user.uid = auth["uid"]
      user.twitter = auth["info"]["nickname"]
      user.keychain = Keychain.from_auth(auth)
      user.save
    end
  end

  def watching(post)
    WatchedItem.where(post_id: post.id, user_id: id).first
  end

  def score
    ProfilePresenter.new(self).score
  end
end

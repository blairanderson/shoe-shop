class User < ActiveRecord::Base
  authenticates_with_sorcery!
  acts_as_voter

  validates_presence_of :username
  validates_uniqueness_of :username , :case_sensitive => false
  validates_length_of :username, :minimum => 5
  
  validates_length_of :password, :minimum => 5, :if => :password
  validates_confirmation_of :password, :if => :password

  validates_presence_of :email
  validates_uniqueness_of :email , :case_sensitive => false

  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :watched_items, dependent: :destroy
  has_many :watched_posts, through: :watched_items, source: :post
  has_one :keychain, dependent: :destroy

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

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

  def can_comment_on_post?(post)
    if Comment.where(post_id: post.id, user_id: id).first
      return false
    else
      return true
    end
  end

  def watching?(post)
    if WatchedItem.where(post_id: post.id, user_id: id).first
      true
    else
      false
    end
  end

  def watching(post)
    WatchedItem.where(post_id: post.id, user_id: id).first
  end

  def score
    ProfilePresenter.new(self).score
  end
end

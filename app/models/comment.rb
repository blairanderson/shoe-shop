class Comment < ActiveRecord::Base
  belongs_to :post
  belongs_to :user

  validates_presence_of :body
  validates_presence_of :post_id
  validates_presence_of :user_id

  after_save :watch_the_post
  def watch_the_post
    WatchedItem.where( {post_id: self.post_id,user_id: self.user_id} ).first_or_create
  end

end

class Comment < ActiveRecord::Base
  belongs_to :post, touch: true
  belongs_to :user

  validates_presence_of :body
  validates_presence_of :post_id
  validates_presence_of :user_id

  after_save :watch_the_post
  def watch_the_post
    WatchedItem.where( {post_id: self.post_id,user_id: self.user_id} ).first_or_create
  end

  after_save :send_notifications 
  def send_notifications
    service = TCO.new
    post = self.post
    post.watchers.where.not(twitter: nil).each do |to|
      service.comment_update( to, post, self) unless to.id == self.user_id
    end
  end
end

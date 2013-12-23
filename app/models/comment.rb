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

  after_save :send_notifications 
  def send_notifications
    post = self.post
    service = TCO.new
    group = post.watchers.where.not(twitter: nil, id: self.user_id)
    group << post.user if post.user.twitter
    group.uniq
    group.each do |to|
      service.update( to, post, self)
    end
  end
end

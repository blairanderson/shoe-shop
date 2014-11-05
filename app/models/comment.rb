class Comment < ActiveRecord::Base
  belongs_to :post, touch: true
  belongs_to :user

  validates_presence_of :body
  validates_presence_of :post_id
  validates_presence_of :user_id

  after_save :send_notifications

  def send_notifications
    if Rails.env.production?
      if self.post.user.twitter.present?
        if self.user_id != post.user_id
          service = TCO.new
          service.comment_update(post.user, post, self)
        end
      end
    end
  end

end

class Comment < ActiveRecord::Base

  belongs_to :post
  belongs_to :user

  validates_presence_of :body
  validates_presence_of :post_id
  validates_presence_of :user_id
  validates_uniqueness_of :user_id, scope: :post_id, message: "Can only comment once per post."
end

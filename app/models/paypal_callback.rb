class PaypalCallback < ActiveRecord::Base
  serialize :response, Hash  

  belongs_to :post
  validate :post, associated: true
  validates_presence_of :post_id

  def trigger_status_change
    post.update(:status => :sold)
  end
end

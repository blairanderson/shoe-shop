class Image < ActiveRecord::Base
  is_impressionable counter_cache: true
  
  belongs_to :post, counter_cache: true, touch: true
  validates_presence_of :post_id
  validates_presence_of :url

  def url_size(number = 500)
    url + "/convert?rotate=0&w=#{number}&h=#{number}&fit=max"
  end
end

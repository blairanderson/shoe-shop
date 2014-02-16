class BlogPost < ActiveRecord::Base
  serialize :images
  
  belongs_to :user  
  def to_param
    "#{id}-#{title}".parameterize
  end
end

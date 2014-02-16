class BlogPost < ActiveRecord::Base
  serialize :images
  
  def to_param
    "#{id}-#{title}".parameterize
  end
end

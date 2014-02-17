class PostSerializer < ActiveModel::Serializer
  attributes :id,
             :title,
             :long_title,
             :href,
             :image_url,
             :created_at,
             :cached_votes_score,
             :images_count,     
             :impressions_count,
             :price

  def href
    post_url(object)
  end

  def image_url
    if object.images.present?
      object.images.first.url_size(100)
    end
  end

  def long_title
    "#{object.title}, size: #{object.size.name}"
  end

  has_many :images
end

class PostSerializer < ActiveModel::Serializer
  attributes :id, :title, :size, :price_cents, :body, :user_id, :visible
end

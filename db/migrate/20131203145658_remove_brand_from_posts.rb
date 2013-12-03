class RemoveBrandFromPosts < ActiveRecord::Migration
  def change
    remove_column :posts, :brand
  end
end

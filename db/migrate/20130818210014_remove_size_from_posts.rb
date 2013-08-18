class RemoveSizeFromPosts < ActiveRecord::Migration
  def change
    remove_column :posts, :size, :string
  end
end

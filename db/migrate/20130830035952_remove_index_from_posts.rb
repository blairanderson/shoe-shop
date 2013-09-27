class RemoveIndexFromPosts < ActiveRecord::Migration
  def change
    ##remove_index :comments, :column => [:user_id, :post_id]
  end
end

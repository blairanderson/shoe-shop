class RemoveIndexFromPosts < ActiveRecord::Migration
  def change
    remove_index :posts, name: "index_comments_on_user_id_and_post_id"
  end
end

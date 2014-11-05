class CleanupTables < ActiveRecord::Migration
  def change
    drop_table :votes
    drop_table :blog_posts
    drop_table :impressions
    drop_table :watched_items
  end
end

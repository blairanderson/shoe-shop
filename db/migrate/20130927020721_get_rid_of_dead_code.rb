class GetRidOfDeadCode < ActiveRecord::Migration
  def change
    drop_table :monologue_posts
    drop_table :monologue_posts_revisions
    drop_table :monologue_taggings
    drop_table :monologue_tags
    drop_table :monologue_users
  end
end

class AddProperIndexToPosts < ActiveRecord::Migration
  def change
    remove_index :posts, name: "index_posts_on_status_enum"
    add_index :posts, :status_enum, where: 'status_enum = 1', :order => {cached_votes_score: :desc, created_at: 'DESC NULLS LAST'}
  end
end
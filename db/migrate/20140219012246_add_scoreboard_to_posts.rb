class AddScoreboardToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :scoreboard, :integer, default: 0
    add_index :posts, :scoreboard
  end
end

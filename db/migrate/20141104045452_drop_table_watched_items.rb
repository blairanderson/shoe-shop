class DropTableWatchedItems < ActiveRecord::Migration
  def change
    drop_table :watched_items
  end
end

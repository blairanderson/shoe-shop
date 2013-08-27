class AddStatusToPost < ActiveRecord::Migration
  def change
    add_column :posts, :status_enum, :integer, default: 0
    add_index :posts, :status_enum
    remove_column :posts, :visible, :boolean
  end
end

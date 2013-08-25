class AddPriceCentsToPosts < ActiveRecord::Migration
  def change
    remove_column :posts, :price
    add_column :posts, :price, :integer
    add_index :posts, :price
  end
end

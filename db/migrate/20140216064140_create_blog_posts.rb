class CreateBlogPosts < ActiveRecord::Migration
  def change
    create_table :blog_posts do |t|
      t.string :title
      t.text :content
      t.text :content_html
      t.text :content_html_raw
      t.integer :user_id
      t.integer :identifier
      t.string :token
      t.text :images

      t.timestamps
    end
    add_index :blog_posts, :identifier
  end
end

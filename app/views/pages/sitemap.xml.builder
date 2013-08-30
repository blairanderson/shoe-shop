xml.instruct! :xml, :version => '1.0', :encoding => 'UTF-8'

# create the urlset
xml.urlset :xmlns => 'http://www.sitemaps.org/schemas/sitemap/0.9' do
  # users
  @users.each do |user|
    xml.url do 
      xml.loc user_url(user)
      xml.lastmod user.updated_at.strftime('%Y-%m-%d')
    end
  end

  @comments.each do |comment|
    xml.url do
      xml.loc comment_url(comment)
      xml.lastmod comment.updated_at.strftime('%Y-%m-%d')
    end
  end

  @posts.each do |post|
    xml.url do
      xml.loc post_url(post)
      xml.lastmod post.updated_at.strftime('%Y-%m-%d')
    end
  end
end

xml.instruct! :xml, :version => '1.0', :encoding => 'UTF-8'

# create the urlset
xml.urlset :xmlns => 'http://www.sitemaps.org/schemas/sitemap/0.9' do

  xml.url do 
    xml.loc root_url
  end
  
  xml.url do 
    xml.loc login_url
  end

  xml.url do 
    xml.loc logout_url
  end

  xml.url do 
    xml.loc about_url
  end

  xml.url do 
    xml.loc contact_url
  end

  xml.url do 
    xml.loc tos_url
  end

  xml.url do 
    xml.loc privacy_policy_url
  end

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

  %w(top bottom oldest newest).each do |sort|
    %w(all sml med lrg xl).each do |filter|
      xml.url do
        xml.loc "www.solesout.com/pairs/" + sort + "/" + filter
      end

      xml.url do
        xml.loc "www.solesout.com/pairs/" + sort + "/" + filter + '/sold'
      end
    end
  end

end

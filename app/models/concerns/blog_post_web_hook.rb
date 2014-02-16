class BlogPostWebHook
  attr_reader :blog_post, :raw_data
  def valid_attrs
    %w(identifier
       title
       token
       images
       content
       content_html
       content_html_raw)
  end

  def initialize(data)
    @raw_data = data
    @blog_post = BlogPost.where(identifier: data[:id]).first_or_initialize
    @blog_post.attributes = parse_raw_data
  end

  def include_user(user)
    blog_post.user = user
    blog_post.save
  end


private
  def parse_raw_data
    valid_data = {}
    valid_attrs.each do |attr|
      valid_data[attr] = self.send("parse_#{attr}")
    end
    valid_data
  end

  def parse_title
    raw_data[:name]
  end

  def parse_images
    html_doc = ::Nokogiri::HTML(parse_content_html_raw)
    # consider the alternative, fetching the image and storing it on S3
    # html_doc.search('img').map do |node|
    #   fetch( node['src'] )
    # end
    
    # def fetch(uri_str, limit = 10)
    #   # You should choose a better exception.
    #   raise ArgumentError, 'too many HTTP redirects' if limit == 0

    #   response = Net::HTTP.get_response(URI(uri_str))

    #   case response
    #   when Net::HTTPFound then
    #     response['location']
    #   when Net::HTTPRedirection then
    #     location = response['location']
    #     warn "redirected to #{location}"
    #     fetch(location, limit - 1)
    #   # when Net::HTTPOK then
    #   #   response
    #   else
    #     uri_str
    #   end
    # end
    html_doc.search('img').map{|node| node['src'] }
  end


  def parse_content
    raw_data[:content]
  end

  def parse_content_html
    raw_data[:content_html]
  end

  def parse_content_html_raw
    raw_data[:content_html_raw]
  end

  def parse_identifier
    raw_data[:id]
  end

  def parse_token
    raw_data[:token]
  end
end
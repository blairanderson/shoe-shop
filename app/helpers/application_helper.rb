module ApplicationHelper
  def site_title
    "SolesOut"
  end

  def header(content)
    content_for :title, content
  end

  def white_logo
    image_tag("logo-white.png", size: "100")
  end

  def blog_helper_url
    begin
      "http://www.solesout.com#{Monologue::Post.last.posts_revisions.last.full_url}"
    rescue Exception => e
      "http://www.solesout.com/"
    end
  end
end

module ApplicationHelper
  def site_title
    "SolesOut"
  end

  def header(content)
    content_for :title, content
  end
end

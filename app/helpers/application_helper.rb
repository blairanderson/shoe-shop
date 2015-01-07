module ApplicationHelper
  def site_title
    "SolesOut"
  end

  def twitter_link
    link_to t('twitter.link'), auth_path(:twitter)
  end

  def header(content)
    content_for :title, content
  end

  def auth_path(provider)
    "/auth/#{provider.to_s.downcase}"
  end

  def robots
    instructions = {
      'users' => 'noindex',
      'filters' => 'index',
      'posts' => 'index'
    }[params[:controller]] || 'index'
    tag :meta, content: instructions, property: 'st:robots'
  end

  def white_logo
    image_tag("solesout-small.png", class: "img-responsive", width: 100, style: "margin-top: -25px;")
  end
end

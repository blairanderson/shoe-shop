module BlogHelper

  def blog_route(route = :root_path)
    Monologue::Engine.routes.url_helpers.send(route)
  end
  
end

module Sorcery
  module TestHelpers
    module Rails
      def login_user_post(user, password='password')
        user_params = {user: {username:user.username, password:password}}
        page.driver.post(sessions_url, user_params) 
      end
    end
  end
end

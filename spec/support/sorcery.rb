module Sorcery
  module TestHelpers
    module Rails
      def login_user_post(user, password='password')
        page.driver.post(sessions_url, { username: user.username, password: password}) 
      end
    end
  end
end

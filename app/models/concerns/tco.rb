class TCO
  include PostsHelper
  include ActionView::Helpers::NumberHelper
  include Rails.application.routes.url_helpers

  def initialize(options={})
  end

  def update(to, body, action)
    client.update notification(to, body, action)
  end

  def notification(user, post, comment)
    tweet = "@#{user.twitter} NEW COMMENT ON #SOLESOUT: " 
    url = "http://www.solesout.com/pairs/#{post.id}#c-#{comment.id} | " 
    message = comment.body[0..(140 - [tweet, url].join.length)]
    [[tweet, url].join , message].join
  end

private
  def client
    @client ||= Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV["TWITTER_CONSUMER_KEY"]
      config.consumer_secret     = ENV["TWITTER_CONSUMER_SECRET"]
      config.access_token        = ENV["TWITTER_ACCESS_TOKEN"]
      config.access_token_secret = ENV["TWITTER_ACCESS_TOKEN_SECRET"]
    end
  end
end
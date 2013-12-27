class TCO
  include PostsHelper
  include ActionView::Helpers::NumberHelper
  include Rails.application.routes.url_helpers

  def initialize(options={})
  end

  def post_update(post)
    update post_notification(post)
  end

  def post_notification(post)
    verbose_post_title(post)
  end

  def comment_update(to, post, comment)
    update comment_notification(to, post, comment)
  end

  def comment_notification(user, post, comment)
    tweet = "@#{user.twitter} NEW COMMENT ON #SOLESOUT: " 
    url = post_url(post, anchor: "c-#{comment.id}") 
    message = comment.body[0..(137 - [tweet, url].join.length)]
    [[tweet, url].join , message].join(" | ")
  end

  def update(text)
    begin
      client.update text
    rescue
      puts "Twitter::Error  - #{text}"
    end
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
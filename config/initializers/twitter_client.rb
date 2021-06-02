class TwitterClient < Twitter::REST::Client
  class << self
    def instance
      @instance ||= new do |config|
        config.consumer_key        = "92ZxaqORQBnqicdSXzhmJRktL"
        config.consumer_secret     = "uWruNhELm1sYNPyuKzjRZphRnodB4yKvQ69qXmdf6ZA6qZ4Lv5"
        config.access_token        = "470967274-xttNDKc647q6rQSwThzPBIWo6UJuJEvoz4wjLhXg"
        config.access_token_secret = "PLvWjIzYlNls5oRa5f8ASh2fHK3qUde6Op4aZ57pI2Zfy"
      end
    end
  end
end

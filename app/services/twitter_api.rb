class TwitterApi
  attr_reader :client

  def initialize
    @client = TwitterClient.instance
  end

  def get_last_7_days_tweets(user, start_date, end_date)
    @client.search(user, since: end_date, until: start_date)
  end
end

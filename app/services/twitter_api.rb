require 'typhoeus'

class TwitterApi
  attr_reader :client

  ENDPOINT_URL = "https://api.twitter.com/2/users/:id/tweets"
  QUERY_PARAMS = {
    "max_results" => 100,
    # "start_time" => 7.days.ago.iso8601,
    # "end_time" => Time.now.iso8601,
    "expansions" => "attachments.poll_ids,attachments.media_keys,author_id",
    "tweet.fields" => "attachments,author_id,conversation_id,created_at,entities,id,lang,public_metrics",
    "user.fields" => "description,public_metrics",
    "exclude" => "retweets",
  }
  BEARER_TOKEN = Rails.application.credentials.dig(:twitter, :bearer_token)

  def self.client
    @client = TwitterClient.instance
  end

  def self.get_user_tweets(url, bearer_token, query_params)
    options = {
      method: 'get',
      headers: {
        "User-Agent" => "v2RubyTwitter",
        "Authorization" => "Bearer #{bearer_token}",
      },
      params: query_params
    }

    twitter_api_request = Typhoeus::Request.new(url, options)
    twitter_api_response = twitter_api_request.run

    return twitter_api_response
  end

  def self.get_user_timeline(user)
    id = client.user(user).id
    endpoint_url = ENDPOINT_URL.gsub(':id', id.to_s)

    user_tweets = get_user_tweets(endpoint_url, BEARER_TOKEN, QUERY_PARAMS)
    JSON.parse(user_tweets.body)
  end
end

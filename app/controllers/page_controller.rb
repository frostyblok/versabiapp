class PageController < ApplicationController
  include Dateable

  def home
  end

  def search_tweets
    user_timeline = TwitterApi.get_user_timeline(params[:query])
    @username = user_timeline.dig("includes", "users", 0, "username")
    @user_metrics = user_timeline.dig("includes", "users", 0, "public_metrics")

    @tweets_data = user_timeline["data"].map {|s| s["public_metrics"].merge("tweet" => s["text"])}
    @retweets_count = @tweets_data.inject(0) {|sum, hsh| sum + hsh["retweet_count"]}
    @like_count = @tweets_data.inject(0) { |sum, hsh| sum + hsh["like_count"] }
    @reply_count = @tweets_data.inject(0) { |sum, hsh| sum + hsh["reply_count"] }
    @quote_count = @tweets_data.inject(0) { |sum, hsh| sum + hsh["quote_count"] }

    @tweet_with_max_replies = @tweets_data.max_by { |obj| obj["reply_count"] }["tweet"]
    @tweet_with_max_likes = @tweets_data.max_by { |obj| obj["like_count"] }["tweet"]
    @tweet_with_max_retweets = @tweets_data.max_by { |obj| obj["retweet_count"] }["tweet"]
  end
end

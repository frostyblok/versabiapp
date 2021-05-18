class PageController < ApplicationController
  include Dateable

  def home
    TwitterApi.new.do_something
  end

  def see
    start_date, end_date = parse_date
    tweet_entities = TwitterApi.new.get_last_7_days_tweets("frostyblok", start_date, end_date)

    render json: { tweet_entities: tweet_entities }
  end
end

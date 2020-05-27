class ApiController < ActionController::API
  # include ActionController::HttpAuthentication::Basic::ControllerMethods
  # http_basic_authenticate_with email: user.email, password: user.password

  def news
    @tweets = Tweet.all.order(id: :desc).limit(50)
    @tweets.map do |tweet|
      {
        id: tweet.id,
        content: tweet.content,
        user_id: tweet.user_id,
        retweets_count: tweet.retweets.count,
        retweeted_from: tweet.retweets.map { |retweet| {user_email: retweet.user.email} }
      }
    end
    render json: @tweets
  end

  def news_between
    selected_date_1 = Date.parse(params[:date_1])
    selected_date_2 = Date.parse(params[:date_2])
    # This will look for records on the given date between 00:00:00 and 23:59:59
    @tweets = Tweet.where(
       created_at: selected_date_1..selected_date_2)

       render json: @tweets
  end

  def create_news
    @tweet = Tweet.create(
      content: params.require(:content),
      user: User.find(params.require(:user_id))
    )

    render json: @tweet
  end
end

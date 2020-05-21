class RetweetsController < ApplicationController
  before_action :authenticate_user!

  def create
    @retweet = Retweet.find_by(user_id: current_user.id, tweet_id: params[:tweet_id])
    if @retweet && @retweet.active
      @retweet.update_attributes(active: false)
      @retweet.delete_retweet
    elsif @retweet && !@retweet.active
      @retweet.update_attributes(active: true)
      @retweet.add_retweet
    else
      @retweet = Retweet.create(user_id: current_user.id, tweet_id: params[:tweet_id])
      @retweet_u = Tweet.create(user_id: current_user.id)
      @retweet.add_retweet
    end
    redirect_to root_path
  end
end

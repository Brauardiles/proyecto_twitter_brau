class TweetsController < ApplicationController
  before_action :authenticate_user!, except: :index
  def index
    if user_signed_in?
      @followers = current_user.followings.pluck(:followed_id)
      @tweet = Tweet.new
      @tweets = Tweet.tweets_for_me(@followers).order(:created_at).page params[:page]
    else
      @tweets = Tweet.order(:created_at).page params[:page]
    end
  end

  def new
    @tweet = Tweet.new
  end

  def create
    @tweet = Tweet.new(tweet_params)
    @tweet.user = current_user
    if @tweet.save
      flash[:notice] = 'Tweet creado exitosamente'
      redirect_to tweets_path
    else
      render :new
    end
  end

  def show
    @tweet = Tweet.find(params[:id])
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def tweet_params
    params.require(:tweet).permit(:content, :image_url)
  end
end

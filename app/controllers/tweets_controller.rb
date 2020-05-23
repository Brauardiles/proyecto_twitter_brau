class TweetsController < ApplicationController
  before_action :authenticate_user!, except: :index
  def index
    @tweet = Tweet.new
    @tweets = Tweet.order(:created_at).page params[:page]
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

class LikesController < ApplicationController
  before_action :authenticate_user!

  def create
    @like = Like.find_by(user_id: current_user.id, tweet_id: params[:tweet_id])
    if @like && @like.active
      @like.update_attributes(active: false)
      @like.delete_like
    elsif @like && !@like.active
      @like.update_attributes(active: true)
      @like.add_like
    else
      @like = Like.create(user_id: current_user.id, tweet_id: params[:tweet_id])
      @like.add_like
    end
    redirect_to root_path
  end
end

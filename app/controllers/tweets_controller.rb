class TweetsController < ApplicationController
  
  def new
    @tweet = Tweet.new
  end

  def create
    @tweet = current_user.tweets.create(tweet_params)
    redirect_to root_url
  end

  private 

  def tweet_params
    params.require(:tweet).permit(:body)
  end
end
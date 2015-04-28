class CommentsController < ApplicationController
  
  def index
    @tweet = Tweet.find(params[:tweet_id])
    @comment = @tweet.comments.create(comment_params)
  end
end
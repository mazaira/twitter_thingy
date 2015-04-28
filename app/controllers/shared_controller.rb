class SharedController < ApplicationController

  def index
    @tweet = Tweet.new

    following_ids = current_user.following.select(:id).map(&:id)
    @tweets = Tweet.where(user_id: following_ids).order(created_at: :desc).includes(:user)
  end
end
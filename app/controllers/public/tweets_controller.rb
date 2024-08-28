class Public::TweetsController < ApplicationController
 def new
  @tweet = Tweet.new
 end 
 
 def create
  @tweet= current_user.tweet.save(tweet_params)
 end 
 
 def index
 end 
 
 def destroy
 end 
 
 private
 
 def tweet_params
  params.require(:tweet).permit(:tweet)
 end 
 
end

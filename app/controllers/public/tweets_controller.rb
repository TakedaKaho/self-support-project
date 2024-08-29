class Public::TweetsController < ApplicationController

 
 def index
  @tweet = Tweet.new
  @tweets= Tweet.all
 end 
 
 def create
  @tweet= current_user.tweet.save(tweet_params)
 end
 
 def destroy
 end 
 
 private
 
 def tweet_params
  params.require(:tweet).permit(:tweet)
 end 
 
end

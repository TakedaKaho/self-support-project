class Public::TweetsController < ApplicationController


 def index
  @tweet = Tweet.new
  @tweets= Tweet.all
 end 
 
 def create
  @tweet= current_user.tweets.new(tweet_params)
  if @tweet.save
   flash[:notice]="頑張りを呟きました！"
   redirect_to tweets_path
  else
   render :index
  end 
 end
 
 def destroy
 end 
 
 private
 
 def tweet_params
  params.require(:tweet).permit(:tweet)
 end 
 
end

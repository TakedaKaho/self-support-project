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
  @tweet = Tweet.find(params[:id])
  
  if @tweet.destroy
    flash[:tweet_notice] = "呟きを削除しました"
  else
    flash[:alert] = "呟きを削除できませんでした"
  end
  
  redirect_to tweets_path
end
 
 private
 
 def tweet_params
  params.require(:tweet).permit(:tweet)
 end 
 
end

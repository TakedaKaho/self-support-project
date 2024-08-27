class Public::UsersController < ApplicationController
    
 def show
   @user = User.find(params[:id])
   @new_goal = Goal.order(created_at: :desc).first
   @today_tasks = current_user.tasks.where(created_at: Time.zone.now.beginning_of_day..Time.zone.now.end_of_day)
 end
 
 def edit
  @user = User.find(params[:id])
 end
 
 def update
  @user = User.find(params[:id])
  if @user.update(user_params)
   flash[:user_notice]="プロフィール更新しました"
   redirect_to user_path(@user)
  else
   render :edit
  end
 end 
 
 def check
 end 
 
 def out
 end
 
 def user_params
  params.require(:user).permit(:name, :body)
end
 
end

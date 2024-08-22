class Public::UsersController < ApplicationController
    
 def show
   @user = User.find(params[:id])
   @new_goal = Goal.order(created_at: :desc).first
 end
 
 def edit
 end
 
 def update
 end
 
 def check
 end 
 
 def out
 end 
 
end

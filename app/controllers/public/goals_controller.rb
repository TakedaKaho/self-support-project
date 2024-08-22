class Public::GoalsController < ApplicationController
 def new
  @goal = Goal.new
 end 
 
 def create
  @goal = Goal.new(goal_params)
  if @goal.save
   redirect_to user_path(resource)
  else
   render :new
  end 
 end 
 
 def index
  @goals = Goal.all
 end 
 
 def destroy
 end 
 
 private
 
  def goal_params
   params.require(:goal).permit(:target_weight, :target_body_fat, :target_date)
  end 
end

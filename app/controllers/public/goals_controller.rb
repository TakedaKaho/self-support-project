class Public::GoalsController < ApplicationController
 def new
  @goal = Goal.new(target_weight: 50, target_body_fat: 20)
 end 
 
 def create
  @goal = current_user.goals.new(goal_params)
  if @goal.save
   redirect_to user_path(current_user)
  else
   render :new
  end 
 end 
 
 def index
  @goals = current_user.goals
 end 
 
 def destroy
  @goal = Goal.find(params[:id])
  @goal.destroy
  flash[:goal_destroy_notice]="目標を削除しました。"
  redirect_to goals_path
 end 
 
 private
 
  def goal_params
   params.require(:goal).permit(:target_weight, :target_body_fat, :target_date)
  end 
end

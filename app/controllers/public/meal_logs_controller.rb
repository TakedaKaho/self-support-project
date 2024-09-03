class Public::MealLogsController < ApplicationController
 def new
  @meal_log= MealLog.new
 end 
 
 def create
  @meal_log = current_user.meal_logs.new(meal_log_params)
  if @meal_log.save
   flash[:meal_log_notice]="BodyLogを記録しました"
   redirect_to meal_logs_path
  else
   render :new
  end 
 end 
 
 def index
 end 
 
 def edit
 end 
 
 def update
 end 
 
 def destroy
 end 
 
 private
 
 def meal_log_params
  params.require(:meal_log).permit(:meal_date, :meal_type, :food_name, :amount)
 end
 
end

class Public::MealLogsController < ApplicationController
 def new
  @meal_log= MealLog.new
 end 
 
 def create
  @meal_log = current_user.meal_logs.new(meal_log_params)
  if @meal_log.save
   flash[:meal_log_notice]="食事を記録しました"
   redirect_to meal_logs_path
  else
   render :new
  end 
 end 
 
 def index
  @meal_logs =current_user.meal_logs
 end 
 
 def edit
  @meal_logs= MealLog.find(params[:id])
 end 
 
 def update
  @meal_logs= MealLog.find(params[:id])
  if @meal_log.update(meal_log_params)
   redirect_to meal_logs_path
   flash[:meal_log_edit_notice]="食事記録を変更しました"
  else
   render :edit
  end
 end 
 
 def destroy
 end 
 
 private
 
 def meal_log_params
  params.require(:meal_log).permit(:meal_date, :meal_type, :food_name, :amount)
 end
 
end

class Public::ExerciseLogsController < ApplicationController
    
 def new
  @exercise =ExerciseLog.new
 end 
 
 def create
  @exercise = current_user.exercise_logs.new(exercise_log_params)
  if @exercise.save
   flash[:exercise_log_notice]="運動頑張った〜！"
   redirect_to exercise_logs_path
  else
   render :new
  end 
 end 
 
 def index
  @exercise_logs = current_user.exercise_logs
 end 
 
 def edit
  @exercise_log = Exercise_log.find_by(params[:id])
 end 
 
 def update
  @exercise_log = Exercise_log.find_by(params[:id])
 end 
 
 def destroy
  @exercise_log = Exercise_log.find_by(params[:id])
  @exercise_log.destroy
  flash[:exercise_log_destroy_notice]="運動記録を削除しました。"
  redirect_to exercise_logs_path
 end 
 
 private
 
 def exercise_log_params
  params.require(:exercise_log).permit(:exercise_date, :exercise_type, :time, :notes)
 end 
 
end

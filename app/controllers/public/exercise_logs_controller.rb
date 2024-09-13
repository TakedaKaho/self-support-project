class Public::ExerciseLogsController < ApplicationController
    
 def new
  @exercise =ExerciseLog.new
 end 
 
 def create
  @exercise =ExerciseLog.new(exercise_log_params)
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
 
 def exercise_log_params
  params.require(:exercise_log).permit(:exercise_date, :exercise_type, :exercise_duration, :notes)
 end 
 
end

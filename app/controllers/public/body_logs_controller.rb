class Public::BodyLogsController < ApplicationController
    
 def new
  @body_log = BodyLog.new
 end 
 
 def create
  @body_log = current_user.body_log.new(body_log_params)
  if @body_log.save
   flash[:notice]="今日のBodyLogを記録しました"
   redirect_to body_logs_path
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
 
 def body_log_params
  params.require(:body_log).permit(:weight, :body_fat, :recorded_at)
 end 
 
end

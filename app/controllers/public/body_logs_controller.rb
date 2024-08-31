class Public::BodyLogsController < ApplicationController
    
 def new
  @body_log = BodyLog.new(weight: 50, body_fat: 20)
 end 
 
 def create
  @body_log = current_user.body_logs.new(body_log_params)
  if @body_log.save
   flash[:body_log_notice]="今日のBodyLogを記録しました"
   redirect_to body_logs_path
  else
   render :new
  end 
 end 
 
 def index
  @body_logs =current_user.body_logs
 end 
 
 def edit
 end 
 
 def update
 end 
 
 def destroy
  @body_log = BodyLog.find(params[:id])
  @body_log.destroy
  flash[:body_log_destroy_notice]="記録を削除しました。"
  redirect_to body_logs_path
 end 
 
 private
 
 def body_log_params
  params.require(:body_log).permit(:weight, :body_fat, :recorded_at)
 end 
 
end

class Public::BodyLogsController < ApplicationController
    
 def new
  @body_log = BodyLog.new(weight: 50, body_fat: 20)
 end 
 
 def create
  @body_log = current_user.body_logs.new(body_log_params)
  if @body_log.save
   flash[:body_log_notice]="BodyLogを記録しました"
   redirect_to body_logs_path
  else
   render :new
  end 
 end 
 
 def index
  @body_logs =current_user.body_logs
 end 
 
 def edit
  @body_log = BodyLog.find(params[:id])
 end 
 
 def update
  @body_log = BodyLog.find(params[:id])
  if @body_log.update(body_log_params)
   redirect_to body_logs_path
   flash[:body_log_edit_notice]="BodyLogを変更しました"
  else
   render :edit
  end
 end 
 
 def destroy
  @body_log = BodyLog.find(params[:id])
  @body_log.destroy
  flash[:body_log_destroy_notice]="BodyLogを削除しました。"
  redirect_to body_logs_path
 end 
 
 private
 
 def body_log_params
  params.require(:body_log).permit(:weight, :body_fat, :recorded_at)
 end 
 
end

class Public::TasksController < ApplicationController
  before_action :set_task, only: [:show, :update_status, :destroy]

  # 新しいタスクの作成フォームを表示
  def new
    @task = Task.new
  end 

  # タスクを作成
  def create
    @task = current_user.tasks.new(task_params)
    if @task.save
      redirect_to tasks_path
      flash[:create_notice]="タスクを設定しました。"
    else
      render :new
    end
  end 

  # タスクの一覧を表示
  def index
    @tasks_by_date = current_user.tasks.order(:created_at).group_by { |task| task.created_at.to_date }
  end 
  

  # タスクの状態を更新
  def update_status
    @task = Task.find(params[:id])
    @task.update(completed: !@task.completed)
    redirect_to tasks_path
  end

  # タスクを削除
  def destroy
    @task.destroy
    redirect_to tasks_path, notice: "タスクが削除されました。"
  end 

  private

  # 指定されたタスクを取得
  def set_task
    @task = current_user.tasks.find(params[:id])
  end

  # タスクのパラメータを許可
  def task_params
    params.require(:task).permit(:tweet)
  end 
end


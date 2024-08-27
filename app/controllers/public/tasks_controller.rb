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
    @tasks = current_user.tasks
  end 
  

  # タスクの状態を更新
  def update_status
    @task.update(completed: !@task.completed)
    redirect_to user_path(current_user), notice: "タスクの状態が更新されました。"
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
    params.require(:task).permit(:detail, :completed)
  end 
end


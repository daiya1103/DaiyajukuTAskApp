class TasksController < ApplicationController
  def index
      @tasks = Task.all
  end

  def new
    @task = current_user.tasks.build
  end

  def create
    @task = current_user.tasks.build(task_params)
    if @task.save
      redirect_to task_path(@task), notice: '今日もお疲れ様でした^^'
    else
      flash_now[:error] = 'まだ書いてない項目があるよ'
      render :new
    end
  end

  def show
    @task = Task.find(params[:id])
  end

  def edit
    @task = current_user.tasks.find(params[:id])
  end

  def update
    @task = current_user.tasks.find(params[:id])
    if @task.update(task_params)
      redirect_to task_path(@task), notice: '更新できました，'
    else
      flash.now[:error] = '更新できませんでした'
      render :edit
    end
  end

  def destroy
    task = current_user.tasks.find(params[:id])
    task.destroy!
    redirect_to root_path, notice: '記事を削除しました，'
  end

  private
    def task_params
        params.require(:task).permit(
          :exihibits,
          :solds,
          :sale,
          :profit,
          :impress
        )
    end
end
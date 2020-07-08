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
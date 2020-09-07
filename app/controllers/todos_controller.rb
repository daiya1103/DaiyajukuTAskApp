class TodosController < ApplicationController

  def index
    
  end

  def show
    @todo = Todo.find(params[:id])
  end

  def new
    @todo = current_user.todos.build
  end

  def create
    @todo = current_user.todos.build(todo_params)
    if @todo.save
      redirect_to todo_path(@todo), notice: '今日も楽しんで行こう'
    else
      flash_now[:error] = 'まだ書いてない項目があるよ'
      render :new
    end
  end

  def edit
  end

  def update

  end

  private
  def todo_params
    params.require(:todo).permit(
      :date_of,
      todocontents_attributes: [:id, :todo, :completed]
    )
  end
end
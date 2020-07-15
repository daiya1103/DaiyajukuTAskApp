class UsersController < ApplicationController

  def show
    user = User.find(params[:id])
    @profile = user.profile 
    @tasks = user.tasks
  end

end
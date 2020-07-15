class ProfilesController < ApplicationController

  def show
    @profile = current_user.profile
    @tasks = current_user.tasks
  end

  def edit
    # if current_user.profile.present?
    #   @profile = current_user.profile
    # else
    #   @profile = current_user.build_profile
    # end
    @profile = current_user.profile || current_user.build_profile
  end

  def update
    @profile = current_user.build_profile(profile_params)
    if @profile.save
      redirect_to profile_path, notice: 'プロフィールを更新しました'
    else
      flash.now[:error] = '更新できませんでした'
      render :edit
    end
    
  end

  private
  
  def profile_params
    params.require(:profile).permit(
      :nickname,
      :enrollment_date,
      :target,
      :theme,
      :avatar
    )
  end
end
class ProfileController < ApplicationController
  def show
    @user = User.friendly.find(params[:id])
    @follow = Follow.new
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params_can_be_modified)
    redirect_to root_path
  end

  protected

  def user_params_can_be_modified
    params.require(:user).permit(:role)
  end
end

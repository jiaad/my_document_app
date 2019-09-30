class ProfileController < ApplicationController
  def show
    @user = User.find(params[:id])
    
    puts "="*30
      puts @profile
    puts "="*30
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

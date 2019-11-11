class ProfileController < ApplicationController
  def show
#    @user = User.find(params[:id])
    @user = User.friendly.find(params[:id])
    @follow = Follow.new

  end

  def follow
    @current = current_user
    @following = Follow.new(user_id: @current.id, following_id: params[:profile_id])
    if @following.save
      redirect_to root_path
      flash[:success]="wow you follwed a user"
    end
  end

  def unfollow
    # @follow = Follow.find()
    @user = User.find(params[:profile_id])
    puts "*"* 90
      @user
      puts "current = #{current_user.id}"
    puts "*"* 90


    @current = current_user
    # @follow = Follow.where(user_id:@current_user.id, following_id: @user)
    # @follow = Follow.where(user_id:@current_user.id)
    @follow = Follow.find_by(user_id: @current.id, following_id: @user)

    puts "="* 90
    puts @follow.id
    puts "="* 90


    if @follow.destroy
      redirect_to root_path
      flash[:success]="wow you un followed"
    else
      flash[:danger]="didn't unfollow"
    end

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

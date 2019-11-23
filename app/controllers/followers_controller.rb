# frozen_string_literal: true

class FollowersController < ApplicationController
  def new
    @follow = Follow.new
  end

  def follow
    @current = current_user
    @following = Follow.new(user_id: @current.id, following_id: params[:profile_id])
    if Follow.check_record(@current.id, params[:profile_id].to_i) == true
      flash[:danger] = 'cannot follow'
      redirect_to profile_path(params[:profile_id])
    elsif @following.save
      flash[:success] = 'wow you follwed a user'
      redirect_to profile_path(params[:profile_id])
    end
  end

  def unfollow
    @follow = Follow.find_by(user_id: current_user.id,
                             following_id: params[:profile_id].to_i)
    if @follow.destroy
      redirect_to profile_path(params[:profile_id])
      flash[:success] = 'wow you unfollowed'
    else
      flash[:danger] = "didn't unfollow"
    end
  end

  protected

  def params_follow
    params.permit(profile_id: @current.id, following_id: :profile_id)
  end
end

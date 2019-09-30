class AdminController < ApplicationController
before_action :enum_verify_admin, :only => :index

  def index
    @users = User.all
  end

  protected
  def enum_verify_admin
    if !user_signed_in? or user_signed_in? && current_user.role != 'admin'
      redirect_to root_path
    end
  end

end

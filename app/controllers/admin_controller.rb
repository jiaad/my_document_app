class AdminController < ApplicationController

  def index

  end

  protected
  def enum_verify_admin
    if user_signed_in? && current_user.role != 'admin'
      redirect_to root_path
    end
  end

end

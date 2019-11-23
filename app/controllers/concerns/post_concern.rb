module PostConcern
  extend ActiveSupport::Concern
  included do
  before_action :redirect_if_not_found, only: [:show, :destroy, :update]
  
  def redirect_if_not_found
    if !Post.exists?(params[:id])
      redirect_to static_not_found_path
    end
  end
  end
end
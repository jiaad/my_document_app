class TimelineController < ApplicationController
  def index
    @posts = Post.followed_users_posts(current_user.id)
    respond_to do |format|
      format.html 
      format.json {render json: @posts}
    end
      puts ':'*10
      puts   location = request.env["REMOTE_ADDR"]
      puts ':'*10
  end
end

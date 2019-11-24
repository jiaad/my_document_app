class TimelineController < ApplicationController
  def index
    @posts = Post.followed_users_posts(current_user.id)
  end
end

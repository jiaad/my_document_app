class CommentsController < ApplicationController

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    @post = Post.find(params[:post_id])
    @comment.post_id = @post.id
    if @comment.save
      redirect_to post_path(@post.id)
    else
      puts "==="*30
        @comment.errors.full_messages
      puts "==="*30
    end

  end

  protected
  def comment_params
    params.require(:comment).permit(:body)
  end

end

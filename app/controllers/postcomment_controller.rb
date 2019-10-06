class PostcommentController < ApplicationController
# def new
  # @comment = PostComment.new
# end

  def create 
    @comment = PostComment.new(comment_params)
    @post = Post.find(params[:post_id])
    # @comment.user_id = current_user.id
    @comment.post_id = @post.id
    # @comment.body = "je suis ma moi"
    if @comment.save
      puts "=*="*90
      puts "yeeeeeeeeeeeeeeeeeee comment created"
      puts "=*="*90
    redirect_to post_path(@post.id)
    else
      puts "="*90
        puts @comment.errors.full_messages
      puts "="*90
    end

  end

  protected
  def comment_params
    params.permit(:PostComment)
    # params.require(:PostComment).permit( :body)
  end
end

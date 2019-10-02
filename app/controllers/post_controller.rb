class PostController < ApplicationController
  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      flash[:notice] = "Post created successfully"
      redirect_to post_path(@post)
    else
      flash[:error] = "Post not created"
      puts "="*30
        puts @post.errors.full_messages
      puts "="*30

      render :new
    end
  end
  protected

  def post_params
    params.require(:post).permit(:description, :user_id, images: [])
  end
end

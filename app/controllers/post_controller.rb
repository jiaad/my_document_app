class PostController < ApplicationController
  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
    @comment.post_id = @post.id
  end
def new
  @post = Post.new
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

  def update
    @post = Post.find(params[:id])
if    @post.update(post_params)
      redirect_to post_path(@post.id)
      else
       puts "="*30
        puts @post.errors.full_messages
      puts "="*30       
    render :edit
    end
  end
 def image_destroy
  #@post = Post.find(params[:id])
  #Post.find_by(id:params[:id],images: images.id ).destroy
  #Post.images.find(params[:images_id])
  @post = Post.find(params[:post_id])
  #@image = ActiveStorage::Attachment.find(params[:id])
  @image = @post.images.find(params[:image_id])
  @image.purge
  #@post.
  redirect_back(fallback_location: edit_post_path(@post.id))
 end
  protected

  def post_params
    params.require(:post).permit(:description, :user_id, images: [])
  end
  alias_method :update_params, :post_params
end

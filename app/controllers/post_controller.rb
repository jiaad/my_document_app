class PostController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]
  before_action :redirect_if_not_found, only: [:show]
  before_action :set_post, except: [:new, :create, :image_destroy]
  def show
    # @post = Post.find(params[:id])
    @comment = Comment.new
    @comment.post_id = @post.id
  end

  def new
    @post = Post.new
  end
  
  def edit
    # @post = Post.find(params[:id])
  end

  def destroy
    # @post = Post.find(params[:id])
    if @post.destroy
      flash[:notice] = "Post deleted successfully"
      redirect_to root_path
    else
      flash[:notice]="you do not have the rights or there is problem"
      error_show(@post)
    end
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
    # @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to post_path(@post.id)
    else
      error_show(@post)       
      render :edit
    end
  end

 def image_destroy
  #@post = Post.find(params[:id])
  #Post.find_by(id:params[:id],images: images.id ).destroy
  #Post.images.find(params[:images_id])
  @post = Post.find(params[:post_id])
  #@image = ActiveStorage::Attachment.find(params[:id])
  #answer # https://stackoverflow.com/questions/53411099/removing-activestorage-attachments-in-rails-5/53444294#53444294
  @image = @post.images.find(params[:image_id])
  @image.purge
  redirect_back(fallback_location: edit_post_path(@post.id))
 end

  protected

  def redirect_if_not_found
    if !Post.exists?(params[:id])
      redirect_to '/'
    end
  end

  def set_post
    @post = Post.find(params[:id])
  end

  def error_show(var, var2)
    puts "="*30
      puts var.errors.full_messages
    puts "="*30
  end

  def post_params
    params.require(:post).permit(:description, :user_id, images: [])
  end
  alias_method :update_params, :post_params
end

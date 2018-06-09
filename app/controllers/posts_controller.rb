class PostsController < ApplicationController
  
  def index
    @posts = Post.all
  end
  
  def write
    @post = Post.create(title: params[:title], content: params[:content])
    uploader = S3Uploader.new
    file = params[:image]
    uploader.store!(file);
    
    @post.image = file
    @post.user_id = current_user
    
    if @post.save
      redirect_to "/posts/index"
    else
      render text: @post.errors.messages[:title].first
    end
  end
  
  def edit
    @post = Post.find(params[:id])
  end
  
  def update
    @post = Post.find(params[:id])
    
    if @post.update(post_params)
      redirect_to @post
    else
      render 'edit'
    end
  end
  
  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    redirect_to posts_path
  end
  
  private
  def post_params
    params.require(:post).permit(:title, :content, :image)
  end
end
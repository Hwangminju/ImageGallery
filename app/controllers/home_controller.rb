class HomeController < ApplicationController
  def index
    @posts = Post.all
  end
  
  def write
    post = Post.create(title: params[:title], content: params[:content])
    uploader = S3Uploader.new
    file = params[:image]
    uploader.store!(file);
    
    post.image = file
    
    if post.save
      redirect_to "/home/index"
    else
      render text: post.errors.messages[:title].first
    end
  end
  
  def reply_write
    reply = Reply.new
    reply.content = params[:content]
    reply.post_id = params[:id_of_post]
    reply.save
    
    redirect_to "/home/index"
  end
  
  private
  def post_params
    params.require(:post).permit(:title, :content, :image)
  end

end

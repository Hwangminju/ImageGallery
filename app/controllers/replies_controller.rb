class RepliesController < ApplicationController
    
    def write
        @reply = Reply.new
        
        @reply.content = params[:content]
        @reply.post_id = params[:id_of_post]
        @reply.save
        @reply.user_id = current_user
        
        redirect_to "/posts/index"
    end
    
    def edit
        @reply = Reply.find(params[:id])
    end
    
    def update
        @reply = Reply.find(params[:id])
        
        if @reply.update(reply_params)
            redirect_to @reply
        else
            render 'edit'
        end
    end
    
    def destroy
        @reply = Reply.find(params[:id])
        @reply.destroy
        
        redirect_to posts_path
    end
            
    private
    def reply_params
        params.require(:reply).permit(:id_of_post, :content)
    end
end

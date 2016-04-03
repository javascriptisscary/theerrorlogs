class CommentsController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource
  
  
  def create
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    
    
    if @comment.save
      redirect_to post_path(@comment.post_id), notice: 'Comment was successfully created'
    else
      redirect_to :back, alert: 'Comment not created. Please try again.'
    end
     
  end

  def destroy
    @comment = Comment.find(params[:id])
    @post = @comment.post_id
    @comment.destroy
    redirect_to post_path(@post), alert: 'Comment was successfully deleted'
  end



  private
  
    def comment_params
      params.require(:comment).permit(:post_id, :content, :user_id)
    end


end

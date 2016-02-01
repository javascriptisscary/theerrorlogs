class PostsController < ApplicationController

  

  def create
    @post = new.Post(post_params)
  end


  def show
    
  end
  
  def edit
    
  end

  def destroy
    
  end

  private
  
    def post_params
      params.require(:post).permit(:user_id, :title, :content)
    end

end

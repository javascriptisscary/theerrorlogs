class RelationshipsController < ApplicationController
  before_action :authenticate_user!
  include RelationshipsHelper
  
  #for followings posts
  def index
    @users = current_user.following.includes(:posts)
    if @users.empty?
      @users = User.all
      flash.now[:alert] = "Currently not following any users. Here's some of our most recents posts"
    end
    @posts = order_posts(@users).paginate(:page => params[:page], :per_page => 5)
    
  end
  
  
  
  def create
    @user = User.find(params[:followed_id])
    current_user.follow(@user)
    respond_to do |format|
      format.html { redirect_to :back }
      format.js { }
    end    
       


  end
    
  
  
  def destroy
    @user = Relationship.find(params[:id]).followed
    current_user.unfollow(@user)
    respond_to do |format|
      format.html { redirect_to :back }
      format.js {  }
    end
   

  end

private

  def follows_params
    params.require(:relationship).permit(:follower_id)
  
  end


end
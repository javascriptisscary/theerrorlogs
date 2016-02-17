class RelationshipsController < ApplicationController
  
  def create
    User.find(params[:follower_id])
    @follow = current_user.follows.build(params[:follower_id])
    
    if @follow.save
        flash[:notice] = "You are following"
    end
    
  end
  
  def destroy
    
  end

private

  def follows_params
    params.require(:follow).permit(:follower_id)
  
  end


end
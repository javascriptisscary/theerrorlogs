class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:show]
  load_and_authorize_resource
  
  def index
    @users = current_user.following.includes(:posts).reverse
    
    if @users.empty?
      render :index, flash: "Currently not following any users. Here's some of our most recents posts"
    end
    
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    
    if @post.save
      redirect_to user_post_path(@post.user, @post), notice: 'Post was successfully created'
    else
      render new_user_post_path, alert: 'Post not created. Please try again.'
    end
    
  end

  def new
    @post = Post.new
  end

  def show
    @post = Post.friendly.find(params[:id])
    @user = User.find(@post.user_id)
    @comments =@post.comments
    @comment = Comment.new
  end
  
  def edit
    @post = Post.friendly.find(params[:id])
  end

  def update
    @post = Post.friendly.find(params[:id])
    if @post.update(post_params)
      redirect_to user_post(@post.user, @post), notice: 'Post successfully updated'
    else
      render :edit, alert: 'Post was not updated. Please try again.'
        
    end
    
  end
  
  def destroy
    @post = Post.friendly.find(params[:id])
    @post.destroy
    redirect_to edit_user_path(current_user)
  end

  private
  
    def post_params
      params.require(:post).permit(:title, :content, :user_id)
    end

end

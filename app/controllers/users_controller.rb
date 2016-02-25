class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:new, :show, :create, :sign_in]
  load_and_authorize_resource except: [:following, :followers ]
  
  def index
  end

  def show
    @user = User.find(params[:id])
    if @user == current_user
        redirect_to edit_user_path(current_user)
    end
    @posts = @user.posts.all.order("created_at DESC").paginate(page: params[:page], per_page: 4) 
  end

  def new
    @user = User.new
  end

  def edit
    @user= current_user
    @posts = @user.posts.all.order("created_at DESC").paginate(page: params[:page], per_page: 4)
  end

  def create
    @user= User.new(user_params)
    
    if @user.save
      redirect_to @user, notice: 'User was successfully created'
    else
      redirect_to root_path, alert: 'User not created'
    end
  end


  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      render :edit, notice: 'User successfully updated'
    else
      render :edit, alert: 'User not updated. Please try again.'
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to root_path, alert: "User has been erased. Goodbye!"
    
  end
  
  
  def following
    @title = "Following"
    @user  = User.find(params[:id])
    @users = @user.following.paginate(page: params[:page])
    render '/shared/_show_follow'
  end

  def followers
    @title = "Followers"
    @user  = User.find(params[:id])
    @users = @user.followers.paginate(page: params[:page])
    render '/shared/_show_follow'
  end
  
  
  
  
    private
     
      def user_params
        params.require(:user).permit(:email, :password, :avatar)
      end
   
end

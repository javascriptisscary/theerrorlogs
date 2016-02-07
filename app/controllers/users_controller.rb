class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:new, :show, :create, :sign_in]
  load_and_authorize_resource
  
  def index
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def edit
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
      render :show, notice: 'User successfully updated'
    else
      render :edit, alert: 'User not updated. Please try again.'
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to root_path, alert: "User has been erased. Goodbye!"
    
  end
  
    private
     
      def user_params
        params.require(:user).permit(:email, :password)
      end
   
end

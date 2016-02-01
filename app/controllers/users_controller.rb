class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:new, :create]
  
  
  def index
  end

  def show
    
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
  end

  def destroy
  end
  
    private
     
      def user_params
        params.require(:user).permit(:email, :password)
      end
   
end

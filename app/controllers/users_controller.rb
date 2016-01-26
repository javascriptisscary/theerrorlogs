class UsersController < ApplicationController
  def index
  end

  def show
  end

  def new
  end

  def edit
  end

  def create
  end

  def update
  end

  def destroy
  end
  
    private
     
      def user_params
        params.require(:user).permit(:email)
      end
   
end

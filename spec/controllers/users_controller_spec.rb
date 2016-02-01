require 'rails_helper'

RSpec.describe UsersController, type: :controller do






  
    
  context "No user is logged in" do

    describe "GET #show" do
      it "redirects to login" do
        @user1 = create(:user)
        get :show, id: @user1.id
        expect(response).to redirect_to(new_user_session_path)
         
       end
    end


    describe "POST #create" do
      
     
      
      it "Creates User" do
        
        
        expect {
          post :create, user: {:email=>"exampleuser2@example.com", :password=>"123456789"}
        }.to change(User, :count).by(1) 
      
      end
       
      
      it "redirects when failing to create user" do
        
        post :create, user: {:email=>"exampleuser2@example.com"}
        expect(response).to redirect_to(root_path)
        
      
      end



    end

  end # end no user logged in

  





  context "User is logged in" do

    before(:each) do
      @user = create(:user)
      sign_in @user
    end

    describe "GET #index" do
      it "returns http success" do
        get :index, id: @user.id
        expect(response).to have_http_status(:success)
      end
    end




    describe "GET #new" do
      it "returns http success" do
        get :new
        expect(response).to have_http_status(:success)
      end
    end

    describe "GET #edit" do
      it "returns http success" do
        get :edit, id: @user.id
        expect(response).to have_http_status(:success)
      end
    end


    describe "GET #update" do
      it "returns http success" do
        get :update, id: @user.id
        expect(response).to have_http_status(:success)
      end
    end

    describe "GET #destroy" do
      it "returns http success" do
        get :destroy, id: @user.id
        expect(response).to have_http_status(:success)
      end
    end


  end # end user logged in
  
  
  
  
  
  
  
  
  
  
  
  
  
  
end
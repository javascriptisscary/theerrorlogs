require 'rails_helper'

RSpec.describe UsersController, type: :controller do






  
    
  context "No user is logged in" do

    describe "GET #show" do
      it "redirects to login" do
        @user1 = build(:user)
        get :show, id: @user1.id
        expect(response).to redirect_to(new_user_session_path)
         
       end
    end


    describe "POST #create" do
      
     
      
      it "Creates User" do
        
        puts "here is your attr #{@user}"
        expect {
          post :create, user: {:email=>"exampleuser2@example.com", :password=>"123456789"}
        }.to change(User, :count).by(1) 
end
       

      end

    end

  





  context "User is logged in" do

    before(:each) do
      @user = create(:user)
      sign_in @user
    end

    describe "GET #index" do
      it "returns http success" do
        get :index
        expect(response).to have_http_status(:success)
      end
    end






      it "returns http success" do
        get :show
        expect(response).to have_http_status(:success)
      end
    





    describe "GET #new" do
      it "returns http success" do
        get :new
        expect(response).to have_http_status(:success)
      end
    end

    describe "GET #edit" do
      it "returns http success" do
        get :edit
        expect(response).to have_http_status(:success)
      end
    end


    describe "GET #update" do
      it "returns http success" do
        get :update
        expect(response).to have_http_status(:success)
      end
    end

    describe "GET #destroy" do
      it "returns http success" do
        get :destroy
        expect(response).to have_http_status(:success)
      end
    end


  end # end user logged in
  
  
  
  
  
  
  
  
  
  
  
  
  
  
end
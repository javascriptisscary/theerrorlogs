require 'rails_helper'
require "cancan/matchers"

RSpec.describe UsersController, type: :controller do

  
  context "No user is logged in" do
    
    
    
    describe "GET #show" do
      before do
        @user1 = create(:user)
      end
      
      it "returns http success" do
        
        get :show, id: @user1.id
        expect(response).to have_http_status(:success)
         
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
    
    context "Authorizations" do

      before do
        @user1 = create(:user)
      end

      describe "PUT #update" do
       
        it "will not have authorization" do
          should_not be_able_to(:update, @user1)
        end
      end

      describe "GET Edit" do
      
        it "will redirect to sign in" do
          get :edit, id:  @user1.id
          expect(response).to redirect_to(new_user_session_path)
        end
      end
    
      describe "DELETE #Destroy" do
        it "will not have authorization" do
          should_not be_able_to(:delete, @user1)
        end
      end
  
    end #authorizations

  end # end no user logged in

  





  context "User is logged in" do

    before do
      @user = create(:user)
      sign_in @user
    end

    describe "GET #index" do
      it "returns http success" do
        get :index, id: @user.id
        expect(response).to have_http_status(:success)
      end
    end

    describe 'GET own #show page' do
      it 'redirects to #edit'do
        get :show, id: @user.id
        expect(response).to redirect_to edit_user_path
      end
    end

    describe 'GET different #show page' do
      before do
      @user1 = create(:user)
      end
      it 'displays user profile' do
        get :show, id: @user1.id
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


    describe "PUT #update" do
      it "updates email" do
        puts @user.attributes
        put :update, id: @user, user: {email: "ladeda@example.com"}
        @user.reload
        expect(response).to have_http_status(:success)
        expect(@user.email).to eql "ladeda@example.com"
      end
    end

    describe "DELETE #destroy" do
      it "deletes the user" do  
        expect {
          delete :destroy, id: @user.id
        }.to change(User, :count).by(-1) 
       end
     end
  
    context "User tries to access other User" do
      before do
        @user1 = create(:user)
      end

      describe "PUT #update" do
       
        it "will not have authorization" do
          should_not be_able_to(:update, @user1)
        end
      end

      describe "GET #Edit" do
      
        it "will redirect to sign in" do
          expect{get :edit, id: @user1.id}.to raise_error(CanCan::AccessDenied)
        end
      end
    
      describe "DELETE #Destroy" do
        it "will not have authorization" do
          should_not be_able_to(:delete, @user1)
        end
      end
  
    end #User tries to access other User

  end # end user logged in
  
  
 
 
 
 
 end 
  
  
  
  
  
  
  
  
  
  

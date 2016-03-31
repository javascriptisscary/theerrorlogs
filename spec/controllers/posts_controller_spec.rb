require 'rails_helper'
require "cancan/matchers"

RSpec.describe PostsController, type: :controller do

 
  context "No User logged in" do
     before do
        @post_maker = create(:user)
        @post = create(:post, user_id: @post_maker.id)
      end
 
    describe "POST #create" do
      it "redirects to new user session" do  
        post :create, post: FactoryGirl.attributes_for(:post)
        expect(response).to redirect_to(new_user_session_path)
      end
    end
 
    describe "DELETE #destroy" do
      it "redirects to new user session" do  
        
          delete :destroy, id: @post.id
        expect(response).to redirect_to(new_user_session_path) 
      end
    end
 
    describe "GET #edit" do
      it "redirects to new user session" do    
        get :edit, id: @post.id
        expect(response).to redirect_to(new_user_session_path)
      end
    end
 
 
    describe "GET #new" do
      it "redirects to new user session" do
        get :new, id: 1
        expect(response).to redirect_to(new_user_session_path)
      end
    end
    
    describe "PUT #update" do
      it "redirects to new user session" do
        put :update, id: @post.id
        expect(response).to redirect_to(new_user_session_path)
      end
    end
   
    describe "GET #index" do
      it "returns http redirect" do
        get :index
        expect(response).to have_http_status(:redirect)
      end
    end 
 
    describe "GET #show" do
    
      
      it "returns http success" do
        
        get :show, id: @post.id
        expect(response).to have_http_status(:success)
      end
    end


  end #end user logged out
  
  
  
  context "User logged in and owner of post" do
     
     before do
        @user = create(:user)
        sign_in @user
        @post_attr = FactoryGirl.attributes_for(:post, user_id: @user.id)
        #create post for updating and destroying
        @post = create(:post, user_id: @user.id)
     end
     
    
    
     describe "POST #create" do
       it "creates a new post" do  
         expect {
           post :create, post: @post_attr
         }.to change(Post, :count).by(1)
         
       end
     end
     
     
     describe "GET #edit" do
       it "returns http success" do    
         get :edit, id: @post.id
         expect(response).to have_http_status(:success)
       end
     end
 
 
     describe "GET #new" do
       it "returns http success" do
         get :new
         expect(response).to have_http_status(:success)
       end
     end
    
    

   
     describe "GET #index" do
       it "returns http success" do
         get :index
         expect(response).to have_http_status(:success)
       end
     end 
 
     describe "GET #show" do
       before do
        @post_maker = create(:user)
        @post = create(:post, user_id: @post_maker.id)
       end
       it "returns http success" do
         get :show, id: @post.id
         expect(response).to have_http_status(:success)
       end
      
     end
  
    
    describe "POST #update" do
       let(:attr) do 
          { :title => 'new title', :content => 'new contentnew contentnew contentnew contentnew contentnew contentnew contentnew contentnew content' }
       end
       it "updates the post" do
         put :update, id: @post.id, post: attr
         @post.reload
         expect(response).to be_success
         expect(@post.title).to eql attr[:title]
         expect(@post.content).to eql attr[:content]
       end
     end
  
  
  
     describe "DELETE #destroy" do
       it "deletes the post" do  
          expect {
          delete :destroy, id: @post.id
        }.to change(Post, :count).by(-1) 
       end
     end
  
  end  #end user logged in and owner of post
  
  
  
  
  describe "User logged in and NOT owner of post" do
      
      before do
        @user = create(:user)
        sign_in @user
        
        #add 1 to user id of post to test user abilites
        @post = create(:post, user_id: @user.id + 1)
      end
      
      
    describe "POST #create" do
      it "will not be authorized" do
        should_not be_able_to(:create, @post)
      end
    end
  
    describe "DELETE #destroy" do
      it "will not have authorization" do
        should_not be_able_to(:destroy, @post)
      end
    end
  
  
    describe "PUT #update" do
      it "will not have authorization" do
        should_not be_able_to(:update, @post)
      end
    end
    
    describe "GET Edit" do
      it "will not have authorization" do
        expect{get :edit, id: (@post.id)}.to raise_error(CanCan::AccessDenied)
      end
    end
  
  
 

  end #end user logged in and NOT owner


end
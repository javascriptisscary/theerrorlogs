require 'rails_helper'
require "cancan/matchers"

RSpec.describe PostsController, type: :controller do

 
  context "No User logged in" do
     before do
        @post_maker = create(:user)
        @post = create(:post, user: @post_maker, user_id: @post_maker.id)
      end
 
    describe "POST #create" do
      it "redirects to new user session" do  
        post :create, {user_id:@post_maker ,post: FactoryGirl.attributes_for(:post)}
        expect(response).to redirect_to(new_user_session_path)
      end
    end
 
    describe "DELETE #destroy" do
      it "redirects to new user session" do  
        
          delete :destroy, {user_id: @post_maker, id: @post.id}
        expect(response).to redirect_to(new_user_session_path) 
      end
    end
 
    describe "GET #edit" do
      it "redirects to new user session" do    
        get :edit, {user_id: @post_maker.id, id: @post.id}
        expect(response).to redirect_to(new_user_session_path)
      end
    end
 
 
    describe "GET #new" do
      it "redirects to new user session" do
        get :new, {user_id: @post_maker, id: 1}
        expect(response).to redirect_to(new_user_session_path)
      end
    end
    
    describe "PUT #update" do
      it "redirects to new user session" do
        put :update, {user_id: @post_maker, id: @post.id}
        expect(response).to redirect_to(new_user_session_path)
      end
    end
   
    describe "GET #index" do
      it "returns http redirect" do
        get :index, user_id: @post_maker.id
        expect(response).to have_http_status(:redirect)
      end
    end 
 
    describe "GET #show" do
    
      
      it "returns http success" do
        
        get :show, {user_id: @post_maker, id: @post.id}
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
           post :create, {user_id: @user ,post: @post_attr}
         }.to change(Post, :count).by(1)
         
       end
     end
     
     
     describe "GET #edit" do
       it "returns http success" do    
         get :edit, {user_id: @user, id: @post.id}
         expect(response).to have_http_status(:success)
       end
     end
 
 
     describe "GET #new" do
       it "returns http success" do
         get :new, user_id: @user
         expect(response).to have_http_status(:success)
       end
     end
    
    

   
     describe "GET #index" do
       it "returns http success" do
         get :index, user_id: @user
         expect(response).to have_http_status(:success)
       end
     end 
 
     describe "GET #show" do
       before do
        @post_maker = create(:user)
        @post = create(:post, user_id: @post_maker.id)
       end
       it "returns http success" do
         get :show, {user_id: @user, id: @post.id}
         expect(response).to have_http_status(:success)
       end
      
     end
  
    
    describe "POST #update" do
       let(:attr) do 
          { :title => 'new title', :content => 'new contentnew contentnew contentnew contentnew contentnew contentnew contentnew contentnew content' }
       end
       it "updates the post" do
         put :update, user_id: @user, id: @post.id, post: attr
         @post.reload
         expect(response).to have_http_status(:redirect)
         expect(@post.title).to eql attr[:title]
         expect(@post.content).to eql attr[:content]
       end
     end
  
  
  
     describe "DELETE #destroy" do
       it "deletes the post" do  
          expect {
          delete :destroy, {user_id: @user, id: @post.id}
        }.to change(Post, :count).by(-1) 
       end
     end
  
  end  #end user logged in and owner of post
  
  
  
  
  
  
  context "User is admin" do
    before do
      @admin = create(:user, admin: true)
      sign_in @admin
      @user = create(:user)
      @post = create(:post, user: @user)
    end
  
  
  describe " GET #edit" do
    it "gets a diff user's edit" do    
        get :edit, {user_id: @post.user_id, id: @post.id}
        expect(response).to have_http_status(:success)
      end
    end
    
     describe "DELETE #destroy" do
       it "deletes the diff user's post" do  
          expect {
          delete :destroy, {user_id: @post.user_id, id: @post.id}
        }.to change(Post, :count).by(-1) 
       end
     end
    
  
  
  describe "POST #update"
    let(:attr) do 
          { :title => 'new title', :content => 'i am admin i am admin i am admin i am admin i am admin i am admin i am admin admin admin admin'}
       end
    
    it "updates the other user's post" do
         put :update, {user_id: @user, id: @post.id, post: attr}
         @post.reload
         expect(response).to have_http_status(:redirect)
         expect(@post.title).to eql attr[:title]
         expect(@post.content).to eql attr[:content]
  
  
    end

end # end admin
  
  
  
  
  
  
  
  
  
  
  
  
  
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
        expect{get :edit, user_id: (@user), id: (@post.id)}.to raise_error(CanCan::AccessDenied)
      end
    end
  
  
 

  end #end user logged in and NOT owner


end
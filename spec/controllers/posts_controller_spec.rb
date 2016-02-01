require 'rails_helper'

RSpec.describe PostsController, type: :controller do

 
  context "No User logged in" do
 
 
    describe "POST #create" do
      it "redirects to new user session" do  
        post :create, post: FactoryGirl.attributes_for(:post)
        expect(response).to redirect_to(new_user_session_path)
      end
    end
 
    describe "GET #destroy" do
      it "redirects to new user session" do  
        get :destroy, id: 1
        expect(response).to redirect_to(new_user_session_path)
      end
    end
 
    describe "GET #edit" do
      it "redirects to new user session" do    
        get :edit, id: 1
        expect(response).to redirect_to(new_user_session_path)
      end
    end
 
 
    describe "GET new" do
      it "redirects to new user session" do
        get :new, id: 1
        expect(response).to redirect_to(new_user_session_path)
      end
    end
    
    describe "GET update" do
      it "redirects to new user session" do
        get :update, id: 1
        expect(response).to redirect_to(new_user_session_path)
      end
    end
   
    describe "GET #index" do
      it "returns http success" do
        get :index, id: 1
        expect(response).to have_http_status(:success)
      end
    end 
 
    describe "GET #show" do
      it "returns http success" do
        get :show, id: 1
        expect(response).to have_http_status(:success)
      end
    end


  end #end user logged out
  
  
  
  context "User logged in" do
     
     before(:each) do
        @user = create(:user)
        sign_in @user
        @post_attr = FactoryGirl.attributes_for(:post)
      
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
         get :edit, id: 1
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
         get :index, id: 1
         expect(response).to have_http_status(:success)
       end
     end 
 
     describe "GET #show" do
       it "returns http success" do
         get :show, id: 1
         expect(response).to have_http_status(:success)
       end
     end
  
  
  
  
     before do   #create post for updating and destroying
       @post1 = create(:post)
     end
  
     describe "POST #update" do
       let(:attr) do 
          { :title => 'new title', :content => 'new contentnew contentnew contentnew contentnew contentnew contentnew contentnew contentnew content' }
       end
       it "updates the post" do
         put :update, id: @post1.id, post: attr
         @post1.reload
         expect(response).to be_success
         expect(@post1.title).to eql attr[:title]
         expect(@post1.content).to eql attr[:content]
       end
     end
  
  
  
     describe "DELETE #destroy" do
       
       
       it "deletes the post" do  
          expect {
          delete :destroy, id: @post1.id
        }.to change(Post, :count).by(-1) 
       end
     end
  
  end  #end user logged in

end

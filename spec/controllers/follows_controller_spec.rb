require 'rails_helper'
require "cancan/matchers"

RSpec.describe FollowsController, type: :controller do
  
  
   
  
 describe "POST #create" do
  before do
     @user = create(:user)
     @follower = create(:user)
     sign_in @user
   end
 
  it "Creates Follower" do
         expect {
           post :create, follow: {follower_id: @follower.id}
         }.to change(Follower, :count).by(1) 
      
      end
 
 
 
 
 end
  



end
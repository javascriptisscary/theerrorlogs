require 'rails_helper'
include Warden::Test::Helpers
Warden.test_mode!

describe "User Follows/unFollows other User" do
  
  before :each do
   @user = User.create(email: 'user@example.com', password: 'password', first_name: 'User', last_name: "Smith")
   @user1 = User.create(email: 'user1@example.com', password: 'password', first_name: 'User1', last_name: "Snappy")
   login_as(@user, :scope => :user)
  end

  it "user follows then unfollows " do
    visit user_path(@user1.id)
    click_link 'Follow'
    expect(page).to have_content "UnFollow"
    
    
    click_link 'UnFollow'
    expect(page).to have_content "Follow"
    
  end
     
  

end
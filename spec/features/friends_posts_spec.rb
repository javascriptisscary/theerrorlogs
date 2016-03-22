require 'rails_helper'
include Warden::Test::Helpers
Warden.test_mode!

describe "User sees latest posts from friends" do
  before do
    @user = create(:user, email: 'user@example.com', password: 'password', first_name: 'User', last_name: "Smith")
    @user1 = create(:user, email: 'user1@example.com', password: 'password', first_name: 'User1', last_name: "Snappy")
    @post = create(:post, title: "Your Mom", user_id: @user1.id)
    @relationship = create(:relationship, follower: @user, followed: @user1)
    login_as(@user, :scope => :user)
  end
  
  
  it "visits profile, clicks on link, and sees friend's post " do
    visit profile_path
    click_link('brand')
    expect(page).to have_content "Your Mom"
  end
    
    
  end
require 'rails_helper'
include Warden::Test::Helpers
Warden.test_mode!

describe "User sees latest posts from friends" do
  before do
    @user = create(:user, email: 'user@example.com', password: 'password', first_name: 'User', last_name: "Smith")
    @user1 = create(:user, email: 'user1@example.com', password: 'password', first_name: 'User1', last_name: "Snappy")
    @post = create(:post, title: "Your Mom", user_id: @user1.id)
    @post1 = create(:post, title: "You won't see me")
    @relationship = create(:relationship, follower: @user, followed: @user1)
    login_as(@user, :scope => :user)
  end
  
  
  it "visits profile, clicks on link, and sees friend's post " do
    visit user_path(@user)
    click_link('Updates')
    expect(page).to have_content "Your Mom"
    expect(page).to_not have_content "You won't see me"
  end
    
    
  describe "User not following anyone, loads alert and most recent posts"
    before do
    @user = create(:user, email: 'user2@example.com', password: 'password', first_name: 'User', last_name: "Smith")
    @user1 = create(:user, email: 'user3@example.com', password: 'password', first_name: 'User1', last_name: "Snappy")
    @post = create(:post, title: "Not a friend but you see my post", user_id: @user1.id)
    login_as(@user, :scope => :user)
  end
    
    it "visits profile, clicks on link, and sees non friend's post " do
      visit user_path(@user)
      click_link('Updates')
      expect(page).to have_content "Not a friend but you see my post"
      expect(page).to have_content "Currently not following any users. Here's some of our most recents posts"
    end
    
    
  end
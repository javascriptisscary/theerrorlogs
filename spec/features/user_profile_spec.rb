require 'rails_helper'
include Warden::Test::Helpers
Warden.test_mode!

describe "User visits profile" do
  before do
    @user = create(:user, email: 'user@example.com', password: 'password', first_name: 'User', last_name: "Smith")
    @user1 = create(:user, email: 'user1@example.com', password: 'password', first_name: 'User1', last_name: "Snappy")
    @post = create(:post, title: "Your Mom", user_id: @user.id)
    @post1 = create(:post, title: "You won't see me")
    @comment = create(:comment, user_id: @user.id, post_id: @post.id)
    login_as(@user, :scope => :user)
  end
  
   it "sees recent posts and clicks on link to post" do
     visit profile_path
     expect(page).to have_content "Your Mom"
     click_link("Your Mom")
     expect(page).to have_content "Leave a Comment"
   end
  
  
  
  it "sees recent comments and clicks on link to post" do
    visit profile_path
    expect(page).to have_content "I'm a random comment"
    click_link("I'm a random comment")
    expect(page).to have_content "1 comment"
  end
  
end
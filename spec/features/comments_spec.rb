require 'rails_helper'
include Warden::Test::Helpers
Warden.test_mode!


describe "User not signed in" do
  before do
    @user= create(:user)
    @post= create(:post, user_id: @user.id)
  end
  
  it "doesn't show a comment box" do
    visit post_path(@post.id)
    expect(page).to have_content "You must sign in to leave a comment"
  end

end




describe "User makes a new comment" do
  
  before do
   @user = create(:user, email: 'user@example.com', password: 'password', first_name: 'John', last_name: "Smith")
   login_as(@user, :scope => :user)
   @post = create(:post, user_id: @user.id, content: "I'm a post made for features testing. Comments shall work please! Please, please, please work." )
  end

  it "makes a new comment then deletes it" do
    visit post_path(@post.id)
    
    
     within(".comment-form") do
      fill_in 'comment_content', with: "I'm a new random comment"
    end
     
     click_button 'Post Comment'
     expect(page).to have_content "I'm a post made for features testing. Comments shall work please! Please, please, please work."
  
  
  
  # delete comment
    within(".comment-info") do
     
    
      click_link 'Delete Comment'
      expect(page).to_not have_content "I'm a post made for features testing. Comments shall work please! Please, please, please work."
    end
  
  end






end
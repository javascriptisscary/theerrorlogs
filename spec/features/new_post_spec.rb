require 'rails_helper'
include Warden::Test::Helpers
Warden.test_mode!

describe "User makes new Post" do
  
  before :each do
   @user = User.create(email: 'user@example.com', password: 'password')
   login_as(@user, :scope => :user)
  end

  it "clicks on new post" do
    visit user_path(@user.id)
    click_link 'New Post'
    
    
    expect(page).to have_content 'Title'
    expect(page).to have_content 'Content'
    
  end
end

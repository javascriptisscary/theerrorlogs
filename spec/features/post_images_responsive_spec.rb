#test not working. marked for fix

require 'rails_helper'
include Warden::Test::Helpers
Warden.test_mode!


describe "User makes a new post with images" do
  
  before :each do
   @user = User.create(email: 'user@example.com', password: 'password', first_name: 'John', last_name: "Smith")
   login_as(@user, :scope => :user)
  end

  it "makes a new post and edits it" do
    visit profile_path
    
    within(".navbar") do
      click_link 'New Post'
    end
    
     within("#new-title") do
      fill_in 'Title', with: 'New Random Blog Post'
    end
     click_on('.btn .btn-default[title="Insert image"]')
      
     
   end
  



end
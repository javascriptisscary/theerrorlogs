require 'rails_helper'
include Warden::Test::Helpers
Warden.test_mode!


describe "User makes new Post" do
  
  before :each do
   @user = User.create(email: 'user@example.com', password: 'password', first_name: 'John', last_name: "Smith")
   login_as(@user, :scope => :user)
  end

  it "makes a new post and edits it" do
    visit user_path(@user)
    within(".navbar") do
      click_link 'New Post'
    end
     within("#new-title") do
      fill_in 'Title', with: 'New Random Blog Post'
    end
     within("#new-content") do
      fill_in 'Content', with: "Ladeda. I'm a random blog post and I'm going to work. Go me! Capybara is the best! Not!"
     end
     click_button 'Submit'
     expect(page).to have_content "Ladeda. I'm a random blog post and I'm going to work. Go me! Capybara is the best! Not!"
  
  
  
    #edit
    click_link 'Edit Post'
    expect(page).to have_content "Ladeda. I'm a random blog post and I'm going to work. Go me! Capybara is the best! Not!"
   
    within("#new-content") do
      fill_in 'Content', with: "I'm an edited blog post."
    end
    
    click_button 'Submit'
    expect(page).to have_content "I'm an edited blog post."
  
  end





end

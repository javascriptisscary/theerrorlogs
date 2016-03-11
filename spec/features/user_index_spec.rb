require 'rails_helper'
include Warden::Test::Helpers
Warden.test_mode!


describe 'User goes to User#index' do
    before do
    @user =create(:user, first_name: "John", last_name: "Madden")
    @user1 = create(:user, first_name: "Pete", last_name: "Rose")
  end


  it "goes to user#index" do
    visit users_path

    expect(page).to have_content "John Madden"
    expect(page).to have_content "Pete Rose"

  end
  
end


describe "Logged in User goes to User#index" do 
  before do
    @user =create(:user, first_name: "John", last_name: "Madden")
    @user1 = create(:user, first_name: "Pete", last_name: "Rose")
    @user3 = User.create(email: 'user@example.com', password: 'password', first_name: "happy", last_name: "dog")
    login_as(@user3, :scope => :user)
  end
  
   it "goes to user#index and searches for John" do
     visit users_path
     within("form") do
       fill_in 'q', with: 'John'
     end
     
     click_button 'Search'
     expect(page).to have_content "John Madden"
   end
   
   
end
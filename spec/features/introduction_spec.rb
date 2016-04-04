# CURRENTLY THE TEST DOES NOT FUNCTION ALTHOUGH IT WORKS IRL


require 'rails_helper'
include Warden::Test::Helpers
Warden.test_mode!



describe "User creates first introduction" do
  before do
    @user = create(:user)
    login_as(@user, :scope => :user)
  end


  it 'adds an introduction on the profile page' do
    visit profile_path
  
     within '.form-group' do
      fill_in 'textarea', with: "I'm a random introduction"
      click_link "Submit Intro"
    end
  
    expect(page).to have_content "I'm a random introduction"
  
  
  end

end
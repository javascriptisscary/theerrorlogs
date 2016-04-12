require 'rails_helper'



describe "Signing in" do
  before do
    create(:user, email: 'user@example.com', password: 'password', first_name: "John", last_name: "Smith")
  end

  describe "Entering wrong password" do

    it "redirects to :back with notice" do
      visit user_session_path
      within("#session") do
        fill_in 'Email', with: 'user@example.com'
        fill_in 'Password', with: 'wrongpassword'
      end
      click_button 'Log in'
      expect(page).to have_content 'Invalid email or password.'
    end

  end





  describe "Sucessful sign in" do
    it "goes to edit page" do
      visit user_session_path
      within("#session") do
        fill_in 'Email', with: 'user@example.com'
        fill_in 'Password', with: 'password'
      end
      click_button 'Log in'
      expect(page).to have_content 'Signed in successfully.'
      expect(page).to have_content 'John Smith'
    end
  end


end

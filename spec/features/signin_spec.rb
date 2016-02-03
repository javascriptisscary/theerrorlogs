require 'rails_helper'


describe "Sign in with wrong credentials" do
  before :each do
    User.create(email: 'user@example.com', password: 'password')
  end
  
  it "redirects to :back with notice" do
    visit '/users/sign_in'
    within("#session") do
      fill_in 'Email', with: 'user@example.com'
      fill_in 'Password', with: 'wrongpassword'
    end
    click_button 'Log in'
    expect(page).to have_content 'Invalid email or password.'
  end
end




describe "Sign in with correct credentials and makes a new post" do
  before :each do
   User.create(email: 'user@example.com', password: 'password')
  end

  it "signs in correctly" do
    visit '/users/sign_in'
    within("#session") do
      fill_in 'Email', with: 'user@example.com'
      fill_in 'Password', with: 'password'
    end
    click_button 'Log in'
    expect(page).to have_content 'Signed in successfully.'
  end

end
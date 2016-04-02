require 'rails_helper'
include Warden::Test::Helpers
Warden.test_mode!

describe "admin sees 'edit post' link for all posts" do

  before do
   @admin = create(:user, admin: true)
   login_as(@admin, :scope => :user)
   @user = create(:user)
   @post = create(:post, user_id: @user.id)
  end
  
  it "has link to edit posts" do
    visit root_path
    within('.post-info') do
      expect(page).to have_content('Edit Post')
    end
  end




end
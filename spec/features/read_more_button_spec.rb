require 'rails_helper'



describe 'User goes to homepage' do
  before do
    @user = create(:user)
    @post =create(:post, user_id: @user.id)
    
  end


  it "shows most recent posts" do
    visit root_path
    save_and_open_page
    click_link('Read More')
    expect(page).to have_content "fjdksjalfjweiojflisjlsdghsafsladiflieilsdfjalsajflsiajfilreghghrueihresu groeijreijdljglreijlierjils"
    
  end
  
end
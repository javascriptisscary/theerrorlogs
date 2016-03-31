require 'rails_helper'



describe 'User goes to homepage' do
  before do
    @user = create(:user)
    @user1 = create(:user)
    @post =create(:post, user_id: @user.id)
    @post1 = create(:post, title: "I need Help", content: "What a wonderful world we live in. Full of joy and happiness and bugs.", user_id: @user1.id)
  end


  it "shows most recent posts" do
    visit root_path
    save_and_open_page
    find_link('Random').visible?
    expect(page).to have_content "fjdksjalfjweiojflisjlsdghsafsladiflieilsdfjalsajflsiajfilreghghrueihresu groeijreijdljglreijlierjils"
    find_link('I need Help').visible?
    expect(page).to have_content "What a wonderful world we live in. Full of joy and happiness and bugs."
  end
  
end
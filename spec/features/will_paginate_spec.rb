require 'rails_helper'


describe "Pagination on User #Edit Table" do
  
  before do
    @user = User.create(email: 'user@example.com', password: 'password', first_name: "John", last_name: "Smith")
    create_list(:post, 6 , user_id: @user.id)
  end

  it "visits User #show Page" do
     visit user_path(@user)
     click_on 'Next'
     within('table') {
       expect(page).to have_content "Random"
     }
  end
    
   
    
end
  
  
    
  


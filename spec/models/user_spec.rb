require 'rails_helper'

RSpec.describe User, type: :model do
  
  
   it "should validate factory user" do
    @user = build(:user)
    expect(@user).to be_valid
  end
  
  it "should not validate users without a password" do
    @user = build(:user, password:"" )
    expect(@user).to_not be_valid
  end
  
 
  it "should not validate users without an email address" do
    @user = build(:user, email: "not_valid_email" )
    expect(@user).to_not be_valid
  end
  

  

  
  
end

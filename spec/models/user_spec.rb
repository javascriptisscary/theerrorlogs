require 'rails_helper'

RSpec.describe User, type: :model do
  
    context "On User create" do
    
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
  
  
   context "portfolio image" do
       
      
  it { should have_attached_file(:avatar) }
  it { should_not validate_attachment_presence(:avatar) }
  it { should validate_attachment_content_type(:avatar).
                allowing('image/png', 'image/gif').
                rejecting('text/plain', 'text/xml') }
  it { should validate_attachment_size(:avatar).
                less_than(1.megabytes) }

end
  
end

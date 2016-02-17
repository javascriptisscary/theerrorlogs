require 'rails_helper'

RSpec.describe Relationship, type: :model do
  
  before(:each) do
    @user = create(:user)
    @user1 = create(:user)
    @relationship = create(:relationship, follower: @user, followed: @user1)
  end

  it 'should be valid' do
    expect(@relationship).to be_valid
  end


  it "should require a follower_id" do
    
      @relationship.follower_id = nil
      expect(@relationship).to_not be_valid
  end


  it "should require a followed_id" do
    
      @relationship.followed_id = nil
      expect(@relationship).to_not be_valid
  end

end
require 'rails_helper'

RSpec.describe Comment, type: :model do
  
  
  context 'when creating a new comment' do
  
    it "should validate factory post" do
      @comment = build(:comment)
      expect(@comment).to be_valid
    end
  
  
    it "should not validate non integer user_id" do
      @comment = build(:post, user_id: "ab")
      expect(@comment).to_not be_valid
    end
  
  
    it "should have a post_id" do
      @comment = build(:comment, post_id: "")
      expect(@comment).to_not be_valid
    end
  
    it "should have content over 2 characters" do
      @comment = build(:post, content: "h")
      expect(@comment).to_not be_valid
    end
    
  end
  
  
  
end

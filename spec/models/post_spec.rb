require 'rails_helper'

RSpec.describe Post, type: :model do
  
  context 'when creating a new post' do
  
    it "should validate factory post" do
      @post = build(:post)
      expect(@post).to be_valid
    end
  
  
    it "should not validate non integer user_id" do
      @post = build(:post, user_id: "ab")
      expect(@post).to_not be_valid
    end
  
  
    it "should have a title present" do
      @post = build(:post, title: "")
      expect(@post).to_not be_valid
    end
  
    it "should have content over 1 character" do
      @post = build(:post, content: "h")
      expect(@post).to_not be_valid
    end
    
  end
  
  
  
  
  
end
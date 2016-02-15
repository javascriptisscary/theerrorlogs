require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the UsersHelper. For example:
#
# describe UsersHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe UsersHelper, type: :helper do
  
  describe "remove_time" do
    before do
      @user = create(:user)
      @post = create(:post, user_id: @user.id)
    end
  
    it "slices created_at into a 10 character date" do
      expect(helper.remove_time(@post).length).to eq(10)
    end
  end
  
end

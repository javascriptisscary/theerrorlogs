require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the PostsHelper. For example:
#
# describe PostsHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe PostsHelper, type: :helper do
  
  describe "no_time" do
    it "returns true" do
      helper.no_time("2016-03-23 16:20:30 UTC").should eq("03/23/2016")
  
    end
  end
end

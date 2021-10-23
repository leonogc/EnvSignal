require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the SessionsHelper. For example:
#
# describe SessionsHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe SessionsHelper, type: :helper do
  describe "helps with login verifications" do
    before :each do
      @u = double('user1', :id => 1)
    end
    it "verifies current user" do

    end
    context "already logged" do
      it "block acess to login" do
      end
      it "answer that you're logged in" do
      end
      
    end
  end
end

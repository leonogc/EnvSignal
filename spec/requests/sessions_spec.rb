require 'rails_helper'

RSpec.describe "Sessions", type: :request do
  describe "GET /new" do
    it "returns http success" do
      get "/sessions/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST /new" do
    it "checks the fields" do
    end
    it "searches for the user" do
    end
    it "authenticates the user" do 
    end
  end

end

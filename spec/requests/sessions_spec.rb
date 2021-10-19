require 'rails_helper'

RSpec.describe "Sessions", type: :request do
  describe "GET /new" do
    it "returns http success" do
      get "/login"
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST /new" do
    it "checks the fields" do
    end
    it "searches for the user" do
      post "/login", params: { session: { username: "ashu", password: "ashu" } }
      expect(User).to respond_to(:find_by) 
    end
    it "authenticates the user" do 
      user1 = User.new(name: "Rogerio Satrah Ka",username: "rogerio_satrah", email: "rogerio_satrah1@gmail.com",birth_date: Date.parse("17/10/1990"),password: "senhasecretaK").save
      post "/login", params: { session: { username: "rogerio_satrah" , password: "senhasecretaK"} }
      expect(assigns(:user)).to respond_to(:authenticate)
    end
  end

end

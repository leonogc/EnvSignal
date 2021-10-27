require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "GET /new" do
    it "returns http success" do
      get "/users/new"
      expect(response).to have_http_status(:success)
    end
  end
  describe "GET /profile" do
    context "logged in" do
      before :each do
        @user = double("user1", name: "Rogerio", birth_date: "1000-10-10", username: "roger", email: "r@mail.com")
        allow(User).to receive(:find_by).with({id: 1}).and_return(@user)
        allow_any_instance_of(UsersController).to receive(:session).and_return({user_id: 1})
      end
      it "returns http success" do
        get "/profile"
        expect(response).to have_http_status(:success)
      end
    end
  end

  describe "GET /edit" do
    before :each do
      @modelName = double("MName")
      allow(@modelName).to receive(:param_key).and_return("User")
      @user = double("user1", model_name: @modelName, name: "Rogerio", birth_date: Date.parse("17/10/1990"), username: "roger", email: "r@mail.com", errors: double("erros"))
      allow(@user.errors).to receive(:any?).and_return(false)

      allow(User).to receive(:find_by).with({id: 1}).and_return(@user)
      allow_any_instance_of(UsersController).to receive(:session).and_return({user_id: 1})
    end
    it "returns http success" do
      get "/edit"
      expect(response).to have_http_status(:success)
    end
  end

  describe "PATCH /edit" do
    before :each do
      @modelName = double("MName")
      allow(@modelName).to receive(:param_key).and_return("User")
      @user = double("user1", model_name: @modelName, name: "Rogerio", birth_date: Date.parse("17/10/1990"), username: "roger", email: "r@mail.com", errors: double("error"))
      allow(@user.errors).to receive(:any?).and_return(false)

      allow(User).to receive(:find_by).with({id: 1}).and_return(@user)
      allow_any_instance_of(UsersController).to receive(:session).and_return({user_id: 1})
      allow_any_instance_of(UsersController).to receive(:edit_params).and_return(1)

      get "/edit"
    end
    it "update user data" do
      expect(@user).to receive(:update).with(1).and_return(true)
      patch "/edit", params: { user: { name: "NOOOO" } }
      expect(response).to redirect_to('/profile')
    end
  end
end

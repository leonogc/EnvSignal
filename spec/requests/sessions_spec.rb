require 'rails_helper'

RSpec.describe "Sessions", type: :request do
  describe "GET /users/login" do
    it "returns http success" do
      get "/users/login"
      expect(response).to have_http_status(:success)
    end
    context "already logged in" do
      it "block access to login" do
        allow_any_instance_of(SessionsController).to receive(:logged_in?).and_return(true)
        get "/users/login"
        expect(response).to redirect_to('/users/profile')
      end
    end
  end

  describe "POST /users/login" do
    before :each do
      allow_any_instance_of(SessionsController).to receive(:current_user).and_return(nil)

      @u = double('user1', :id => 1, :username => "rogerio_satrah", :password => "senhasecretaK")
      @params = { session: { username: "rogerio_satrah", password: "senhasecretaK" } }

      allow(@u).to receive(:authenticate).with("senhasecretaK") { @u }
      expect(User).to receive(:find_by).with({:username=>"rogerio_satrah"}).and_return(@u)
    end
    it "searches and authenticates for the user" do
      post "/users/login", params: @params
      expect(assigns(:user)).to eq(@u)
    end
    it "signs the user in" do
      post "/users/login", params: @params
      expect(session[:user_id]).to eql(@u.id)
    end
  end

  describe "DELETE /users/sign_out" do
    context "already logged" do
      before :each do
        @u = double('user1', :id => 1)
        @params = { session: { username: "rogerio_satrah", password: "senhasecretaK" } }

        allow(@u).to receive(:authenticate) { @u }
        expect(User).to receive(:find_by).with({:username=>"rogerio_satrah"}).and_return(@u)
        allow_any_instance_of(SessionsController).to receive(:block_access)

        post "/users/login", params: @params

        expect(User).to receive(:find_by).with({ :id=> 1 }).and_return(@u)
      end
      it "signs the user out" do
        delete "/users/sign_out"
        expect(session).not_to include(:user_id)
        expect(assigns(:current_user)).to be_nil
        expect(response).to redirect_to('/users/login')
      end
    end
  end

end

require 'rails_helper'

RSpec.describe "Sessions", type: :request do
  describe "GET /new" do
    it "returns http success" do
      get "/login"
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST /new" do
    before :each do
      allow_any_instance_of(SessionsHelper).to receive(:current_user).and_return(nil)
      @u = double('user1', :id => 1, :username => "rogerio_satrah", :password => "senhasecretaK")
      allow(@u).to receive(:authenticate).with("senhasecretaK") { @u }
      expect(User).to receive(:find_by).with({:username=>"rogerio_satrah"}).and_return(@u)
    end
    it "searches and authenticates for the user" do
      post "/login", params: { session: { username: "rogerio_satrah", password: "senhasecretaK" } }
      expect(assigns(:user)).to eq(@u)
    end
    it "signs the user in" do
      post "/login", params: { session: {username: "rogerio_satrah", password: "senhasecretaK"} }
      expect(session[:user_id]).to eql(@u.id)
    end
  end

  describe "DELETE /sign_out" do
    context "already logged" do
      before :each do
        @u = double('user1', :id => 1)
        expect(User).to receive(:find_by).with({ :id=> 1 }).and_return(@u)
        allow_any_instance_of(SessionsController).to receive(:authorize) do
          session = {user_id: 1}
          @current_user ||= User.find_by(id: session[:user_id])
        end
        
      end
      it "signs the user out" do
        delete "/sign_out"
        expect(session).not_to include(:user_id)
        expect(assigns(:current_user)).to be_nil
        expect(response).to redirect_to('/login')
      end
    end
  end

end

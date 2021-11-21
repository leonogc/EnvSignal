require 'rails_helper'

RSpec.describe "Sessions", type: :request do
  describe "GET /login" do
    it "returns http success" do
      get "/login"
      expect(response).to have_http_status(:success)
    end
    context "already logged in" do
      it "block access to login" do
        allow_any_instance_of(SessionsController).to receive(:logged_in?).and_return(true)
        get "/login"
        expect(response).to redirect_to('/users/profile')
      end
    end
  end

  describe "POST /login" do
    before :each do
      allow_any_instance_of(SessionsController).to receive(:current_user).and_return(nil)

      @u = double('user1', :id => 1, :username => "rogerio_satrah", :password => "senhasecretaK")
      @params = { session: { username: "rogerio_satrah", password: "senhasecretaK" } }

      allow(@u).to receive(:authenticate).with("senhasecretaK") { @u }
      expect(User).to receive(:find_by).with({:username=>"rogerio_satrah"}).and_return(@u)
    end
    it "searches and authenticates for the user" do
      post "/login", params: @params
      expect(assigns(:user)).to eq(@u)
    end
    it "signs the user in" do
      post "/login", params: @params
      expect(session[:user_id]).to eql(@u.id)
    end
  end

  describe "DELETE /sign_out" do
    context "already logged" do
      before :each do
        @u = double('user1', :id => 1)
        @params = { session: { username: "rogerio_satrah", password: "senhasecretaK" } }

        allow(@u).to receive(:authenticate) { @u }
        expect(User).to receive(:find_by).with({:username=>"rogerio_satrah"}).and_return(@u)
        allow_any_instance_of(SessionsController).to receive(:block_access)

        post "/login", params: @params

        expect(User).to receive(:find_by).with({ :id=> 1 }).and_return(@u)
      end
      it "signs the user out" do
        delete "/sign_out"
        expect(session).not_to include(:user_id)
        expect(assigns(:current_user)).to be_nil
        expect(response).to redirect_to('/login')
      end
    end
  end

  describe "GET list" do
    before :each do
      @a = double('authority1', :id => 1, :identifier => 193, :password => 'SenhaDosBombeirosTeste', :name => 'Corpo de Bombeiros')
      @params = {identifier: 193, password: 'SenhaDosBombeirosTeste'}

      allow_any_instance_of(AuthoritiesController).to receive(:authority_block_access)
      allow(@a).to receive(:authenticate).with('SenhaDosBombeirosTeste') {@a}
      
      expect(Authority).to receive(:find_by).with({:identifier=> '193'}).and_return(@a)
      post '/authorities/login', params: @params
      expect(Authority).to receive(:find_by).with({:id=> 1}).and_return(@a)
    end
    it 'returns HTTP Success' do
      post '/setLocation', params: {latitude: 0, longitude: 0}
      expect(response).to have_http_status(:success)
      expect(session).to include(:latitude)
      expect(session).to include(:longitude)
    end
  end
end

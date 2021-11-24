require 'rails_helper'

RSpec.describe "Authorities", type: :request do
  describe "GET authorities/login" do
    it 'returns HTTP Success' do
      get '/authorities/login'
      expect(response).to have_http_status(:success)
    end
    context 'already logged in' do
      it 'block access to login' do
        allow_any_instance_of(AuthoritiesController).to receive(:authority_logged_in?).and_return(true)
        get '/authorities/login'
        expect(response).to redirect_to('/authority')
      end
    end
  end

  describe "POST authorities/login" do
    before :each do
      allow_any_instance_of(AuthoritiesController).to receive(:current_authority).and_return(nil)

      @a = double('authority1', :id => 1, :identifier => 193, :password => 'SenhaDosBombeirosTeste', :name => 'Corpo de Bombeiros')
      @params = {identifier: 193, password: 'SenhaDosBombeirosTeste'}

      allow(@a).to receive(:authenticate).with('SenhaDosBombeirosTeste') {@a}
      expect(Authority).to receive(:find_by).with({:identifier=> '193'}).and_return(@a)
    end
    it 'searches and authenticates for the authority' do
      post '/authorities/login', params: @params
      expect(assigns[:authority]).to eql(@a)
    end
    it 'signs the authority in' do
      post '/authorities/login', params: @params
      expect(session[:authority_id]).to eql(@a.id)
    end
  end

  describe "DELETE /authorities/sign_out" do
    context "already logged" do
      before :each do
        @a = double('authority1', :id => 1, :identifier => 193, :password => 'SenhaDosBombeirosTeste', :name => 'Corpo de Bombeiros')
        @params = {identifier: 193, password: 'SenhaDosBombeirosTeste'}

        allow_any_instance_of(AuthoritiesController).to receive(:authority_block_access)
        allow(@a).to receive(:authenticate).with('SenhaDosBombeirosTeste') {@a}
        
        expect(Authority).to receive(:find_by).with({:identifier=> '193'}).and_return(@a)
        post '/authorities/login', params: @params
        expect(Authority).to receive(:find_by).with({:id=> 1}).and_return(@a)
      end
      
      it 'signs the authority out' do
        expect(session).to include(:authority_id)
        delete "/authorities/sign_out"
        expect(session).not_to include(:authority_id)
        expect(assigns(:current_authority)).to be_nil
        expect(response).to redirect_to('/authorities/login')
      end
    end

  end

end

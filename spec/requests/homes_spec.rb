require 'rails_helper'

RSpec.describe "Homes", type: :request do
    it 'returns HTTP Success' do
        get '/'
        expect(response).to have_http_status(:success)
    end
    
    
    context 'already logged in as user' do
        before :each do
            @user = double("user1", id: 1, name: "Rogerio", birth_date: "1000-10-10", username: "roger", email: "r@mail.com")
            allow(User).to receive(:find_by).with({id: 1}).and_return(@user)
            allow_any_instance_of(HomesController).to receive(:session).and_return({user_id: 1})
          end
        it 'block access to login' do
            get '/'
            expect(response).to redirect_to('/user')
        end
    end
    context 'already logged in as authority' do
        before :each do
            @a = double('authority1', :id => 1, :identifier => 193, :password => 'SenhaDosBombeirosTeste', :name => 'Corpo de Bombeiros')
            @params = {identifier: 193, password: 'SenhaDosBombeirosTeste'}
            
            allow_any_instance_of(AuthoritiesController).to receive(:authority_block_access)
            allow(@a).to receive(:authenticate).with('SenhaDosBombeirosTeste') {@a}
            
            expect(Authority).to receive(:find_by).with({:identifier=> '193'}).and_return(@a)
            post '/authorities/login', params: @params
            expect(Authority).to receive(:find_by).with({:id=> 1}).and_return(@a)
        end
        it 'block access to login' do
            get '/'
            expect(response).to redirect_to('/authority')
        end
    end
    
end

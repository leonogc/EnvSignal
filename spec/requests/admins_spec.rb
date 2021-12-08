require 'rails_helper'

RSpec.describe "Admins", type: :request do
  describe "GET admin/index" do
    it 'returns HTTP Success' do
      get '/admin/login'
      expect(response).to have_http_status(:success)
    end
    context 'already logged in' do
      it 'block access to login' do
        allow_any_instance_of(AdminsController).to receive(:admin_logged_in?).and_return(true)
        get '/admin/login'
        expect(response).to redirect_to('/admin')
      end
    end
  end

  describe "POST admin/login" do
    before :each do
      allow_any_instance_of(AdminsController).to receive(:current_admin).and_return(nil)

      @ad = double('admin1', :id => 1, :username => 'admin', :password => 'admin123')
      @params = {username: 'admin', password: 'admin123'}

      allow(@ad).to receive(:authenticate).with('admin123') {@ad}
      expect(Admin).to receive(:find_by).with({:username => 'admin'}).and_return(@ad)
    end
    it 'searches and authenticates for the admin' do
      post '/admin/login', params: @params
      expect(assigns[:admin]).to eql(@ad)
    end
    it 'signs the admin in' do
      post '/admin/login', params: @params
      expect(session[:admin_id]).to eql(@ad.id)
    end
  end

  describe "DELETE /admin/sign_out" do
    context "already logged" do
      before :each do
        @ad = double('admin1', :id => 1, :username => 'admin', :password => 'admin123')
        @params = {username: 'admin', password: 'admin123'}

       allow_any_instance_of(AdminsController).to receive(:admin_block_access)
       allow(@ad).to receive(:authenticate).with('admin123') {@ad}

       expect(Admin).to receive(:find_by).with({:username => 'admin'}).and_return(@ad)
       post '/admin/login', params: @params
       expect(Admin).to receive(:find_by).with({:id => 1}).and_return(@ad)
      end

      it 'signs the admin out' do
        expect(session).to include(:admin_id)
        delete "/admin/sign_out"
        expect(session).not_to include(:admin_id)
        expect(assigns(:current_admin)).to be_nil
        expect(response).to redirect_to("/admin/login")
      end
    end

  end

  describe "GET /admin/list_users" do
    context "already logged" do
      before :each do
        @ad = double('admin1', :id => 1, :username => 'admin', :password => 'admin123')
        @params = {username: 'admin', password: 'admin123'}
        
        allow_any_instance_of(AdminsController).to receive(:admin_block_access)
        allow(@ad).to receive(:authenticate).with('admin123') {@ad}
        
        expect(Admin).to receive(:find_by).with({:username => 'admin'}).and_return(@ad)
        post '/admin/login', params: @params
        expect(Admin).to receive(:find_by).with({:id => 1}).and_return(@ad)
      end
      
      it 'access granted' do
        expect(session).to include(:admin_id)
        get "/admin/list_users"
        expect(response).to have_http_status(:success)
      end
    end
  end
  
  describe "GET /edit/edit_user" do
    context "already logged" do
      before :each do
        @modelName = double("MName")
        allow(@modelName).to receive(:param_key).and_return("User")
        @ad = double('admin1', :id => 1, :username => 'admin', :password => 'admin123')
        @user = double("user1", id: 1, model_name: @modelName, name: "Rogerio", birth_date: double("1000-10-10", strftime: true), created_at: double("1000-10-10", strftime: true), username: "roger", email: "r@mail.com", errors: double('error'))
        @params = {username: 'admin', password: 'admin123'}
        
        allow_any_instance_of(AdminsController).to receive(:admin_block_access)
        allow(@ad).to receive(:authenticate).with('admin123') {@ad}
        allow(User).to receive(:find_by) {@user}
        allow(@user.errors).to receive(:any?).and_return(false)
        
        expect(Admin).to receive(:find_by).with({:username => 'admin'}).and_return(@ad)
        post '/admin/login', params: @params
        expect(Admin).to receive(:find_by).with({:id => 1}).and_return(@ad)
      end
      
      it 'returns HTTP Success' do
        expect(session).to include(:admin_id)
        get "/admin/edit_user?user=1"
        expect(response).to have_http_status(:success)
      end
    end
  end

end

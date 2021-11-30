class AdminsController < ApplicationController
    before_action :admin_block_access, except: [:destroy, :index]
    before_action :admin_authorize, except: [:new, :create]
    
    def new
    end

    def create
       if params[:username] == '' or params[:password] == ''
            flash.alert = 'Username or Password not entered'
            render 'new'
        else
            @admin = Admin.find_by(username: params[:username])
            if @admin.present? && @admin.authenticate(params[:password])
                session[:admin_id] = @admin.id
                redirect_to :action => "index"
            else
                flash.alert = 'Incorrect username or password'
                render 'new'
            end
        end
    end

    def index
    end

    def destroy
        admin_sign_out
        redirect_to '/admin/login'
    end

    def admin_sign_out
        session.delete(:admin_id)
        @current_admin = nil
    end

    def admin_block_access
        if admin_logged_in?
            redirect_to '/admin'
        end
    end
end

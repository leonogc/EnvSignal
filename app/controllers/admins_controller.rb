class AdminsController < ApplicationController
    before_action :admin_block_access, only: [:new, :create]
    before_action :admin_authorize, except: [:new, :create]
    
    def new
    end

    def create
       if params[:username] == '' or params[:password] == '' or !params[:username] or !params[:password] 
            flash.alert = 'Username or Password not entered'
            redirect_to '/admin/login'
        else
            @admin = Admin.find_by(username: params[:username])
            if @admin.present? && @admin.authenticate(params[:password])
                session[:admin_id] = @admin.id
                redirect_to :action => "index"
            else
                flash.alert = 'Incorrect username or password'
                redirect_to '/admin/login'
            end
        end
    end

    def index
    end

    def list_users
        @users = User.all().select(:id, :username, :email, :name, :birth_date, :created_at)
    end

    def edit_user
        @user = User.find_by(id: params.permit(:user)['user'])
    end

    def update_user
        @user = User.find_by(id: params["user"]["id"])
        if @user.update(user_edit_params)
            flash.alert = 'User updated!'
            respond_to do |format|
                format.html { redirect_to '/admin/list_users', notice: "User was successfully updated." }
                format.json { head :no_content }
            end
        else
            render action: :edit_user
        end
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

    private
    def user_edit_params
        params.require(:user).permit(:id, :username, :name, :email, :birth_date)
    end
end

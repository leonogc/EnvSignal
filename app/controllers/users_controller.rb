class UsersController < ApplicationController
    before_action :user_authorize, except: [:new, :create, :delete]
    before_action :block_access, except: [:show, :edit, :update, :delete]
    before_action :validate_user_login, only: [:show]
    before_action :admin_authorize, only: [:delete]

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            respond_to do |format|
                format.html { redirect_to controller: 'sessions', action: 'new'}
            end
        else
            render 'new'
        end
    end

    def show
        @user = User.find_by(id: session[:user_id])
    end

    def edit
        @user = User.find_by(id: session[:user_id])
    end
    
    def update
        @user = User.find_by(id: session[:user_id])
        
        if @user.update(edit_params)
            flash.alert = 'Profile updated!'
            redirect_to '/users/profile'
        else
            render action: :edit
        end
    end

    def delete
        @id = params.permit(:user)['user']
        @user = User.find_by(id: @id)
        @user.destroy
        respond_to do |format|
            format.html { redirect_to '/admin/list_users', notice: "User was successfully removed." }
            format.json { head :no_content }
        end
    end

    private
    def user_params
        params.require(:users).permit(:name, :email, :birth_date, :username, :password, :password_confirmation, :email_confirmation)
    end

    private
    def edit_params
        params.require(:user).permit(:name, :email, :birth_date)
    end
end

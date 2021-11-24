class UsersController < ApplicationController
    before_action :user_authorize, except: [:new, :create]
    before_action :block_access, except: [:show, :edit, :update]
    before_action :validate_user_login, only: [:login]

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

    def current_authority
        @current_authority ||= Authority.find_by(id: session[:authority_id])
    end

    def validate_user_login
        if !current_authority.nil?
            redirect_to '/authority'
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

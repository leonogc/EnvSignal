class UsersController < ApplicationController
    before_action :authorize, except: [:new, :create]
    before_action :correct_user, only: [:show, :edit, :update]

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
        @user = User.find(params[:id])
    end
    
    def update
        @user = User.find(params[:id])
        if @user.update_attributes(user_params)
            redirect_to 'profile'
        else
            render action: :edit
        end
    end

    private
    def user_params
        params.require(:users).permit(:name, :email, :birth_date, :username, :password, :password_confirmation, :email_confirmation)
    end

end

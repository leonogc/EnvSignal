class UsersController < ApplicationController
    before_action :authorize, except: [:new, :create, :show]
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
    end

    def login
        @user = User.find_by(username: user_params[:username])
    end

    private
    def user_params
        params.require(:users).permit(:name, :email, :birth_date, :username, :password, :password_confirmation, :email_confirmation)
    end

end

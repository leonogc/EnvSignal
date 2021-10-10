class UsersController < ApplicationController

    def show
    end
    
    def login
        @user = User.find_by(username: user_params[:username])
    end

    private
    def user_params
        params.require(:users).permit(:name, :email, :birth_date, :username, :password)
    end
end

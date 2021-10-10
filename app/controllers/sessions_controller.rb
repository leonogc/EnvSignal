class SessionsController < ApplicationController
  def new
  end

  before_action :block_access, except: [:destroy]
  def create
    @user = User.find_by(username: params[:session][:username])
    if @user && @user.authenticate(params[:session][:password])
      sign_in(@user)
      redirect_to @root
    else
      render 'new'
    end
  end

  def destroy
  end

end

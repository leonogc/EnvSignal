class SessionsController < ApplicationController
  def new
  end

  before_action :block_access, except: [:destroy]
  def create
    @user_validate = User.new(login_user: params[:session][:username], login_pwd: params[:session][:password])
    if !@user_validate.valid?(:login_account)
      render 'new'
    end

    @user = User.find_by(username: params[:session][:username])
    if @user && @user.authenticate(params[:session][:password])
      sign_in(@user)
      redirect_to @root
    else
      render 'new'
    end
  end

  def destroy
    sign_out
    redirect_to @login
  end

end

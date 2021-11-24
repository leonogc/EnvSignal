class SessionsController < ApplicationController
  before_action :block_access, except: [:destroy, :setLocation]
  before_action :user_authorize, except: [:new, :create, :show]
  before_action :validate_user_login, only: [:new, :create]

  def new

  end

  def create
    if !params[:session][:username] or params[:session][:username] == '' or !params[:session][:password] or params[:session][:password] == ''
      flash.alert = 'Username or Password not entered'
      render 'new'
    else
      @user = User.find_by(username: params[:session][:username])
      if !@user
        flash.alert = 'Incorrect username or password not found!'
        render 'new'
      elsif @user.authenticate(params[:session][:password])
        sign_in(@user)
        redirect_to '/user'
      else
        flash.alert = 'Incorrect username or password not found!'
        render 'new'
      end
    end
  end

  def destroy
    sign_out
    redirect_to '/users/login'
  end

  def sign_in (user)
    session[:user_id] = @user.id
  end

  def sign_out
    session.delete(:user_id)
    @current_user = nil
  end

  def setLocation
    session[:latitude] = params[:latitude]
    session[:longitude] = params[:longitude]
  end
end

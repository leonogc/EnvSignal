class SessionsController < ApplicationController
  before_action :block_access, except: [:destroy]
  before_action :authorize, except: [:new, :create, :show]

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
        redirect_to '/'
      else
        flash.alert = 'Incorrect username or password not found!'
        render 'new'
      end
    end
  end

  def destroy
    sign_out
    redirect_to '/login'
  end

  def sign_in (user)
    session[:user_id] = @user.id
  end

  def sign_out
    session.delete(:user_id)
    @current_user = nil
  end

  def block_access
    if logged_in?
      redirect_to users_path
    end
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def logged_in?
    !current_user.nil?
  end

end

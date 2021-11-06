class HomesController < ApplicationController
  def index
    @user = User.find_by(id: session[:user_id])
    if(@user != nil)
      redirect_to '/index/user'
    end
  end
  
  def user
    @markers = Marker.general(session[:user_id])
    @markers_own_user = Marker.own_user(session[:user_id])
  end
end

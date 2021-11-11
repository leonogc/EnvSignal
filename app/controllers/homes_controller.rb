class HomesController < ApplicationController
  def index
    @user = User.find_by(id: session[:user_id])
    if(@user != nil)
      redirect_to '/index/user'
    end
  end
  
  def user
    @markers_pending = Marker.pending_marker(session[:user_id])
    @markers_verified = Marker.verified_marker(session[:user_id])
    @markers_own_user = Marker.own_user(session[:user_id])
  end
end

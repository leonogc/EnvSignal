class HomesController < ApplicationController
  def index
    @user = User.find_by(id: session[:user_id])
    if(@user != nil)
      redirect_to '/user'
    end
    @authority = Authority.find_by(id: session[:authority_id])
    if(@authority != nil)
      redirect_to '/authority'
    end
    
    @markers_pending_nouser = Marker.pending_marker_nouser()
    @markers_verified_nouser = Marker.verified_marker_nouser()
  end
  
  def user
    @markers_pending = Marker.pending_marker(session[:user_id])
    @markers_verified = Marker.verified_marker(session[:user_id])
    @markers_own_user = Marker.own_user(session[:user_id])
  end

  def authority
    @markers_pending = Marker.pending_marker(session[:authority_id])
    @markers_verified = Marker.verified_marker(session[:authority_id])
    @markers_own_user = Marker.own_user(session[:authority_id])
  end

  def login
    @user = User.find_by(id: session[:user_id])
    if(@user != nil)
      redirect_to '/user'
    end
    @authority = Authority.find_by(id: session[:authority_id])
    if(@authority != nil)
      redirect_to '/authority'
    end
  end
end

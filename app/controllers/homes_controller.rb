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
    @markers_pending = Marker.pending_marker(session[:user_id], 0)
    @markers_verified = Marker.verified_marker(session[:user_id], 0)
    @markers_own_user_verified = Marker.own_user_verified(session[:user_id], 0)
    @markers_own_user_pending = Marker.own_user_pending(session[:user_id], 0)
  end

  def authority
    @markers_pending = Marker.pending_marker(session[:authority_id], 1)
    @markers_verified = Marker.verified_marker(session[:authority_id], 1)
    @markers_own_user = Marker.own_user(session[:authority_id], 1)
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

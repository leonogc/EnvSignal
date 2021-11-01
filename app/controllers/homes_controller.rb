class HomesController < ApplicationController
  def index
    @user = User.find_by(id: session[:user_id])
    if(@user != nil)
      redirect_to '/index/user'
    end
  end
  
  def user
    @markers = Marker.all
    
  end
end

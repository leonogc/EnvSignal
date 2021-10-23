class HomesController < ApplicationController
  def index
    @markers = Marker.all
  end
  
end

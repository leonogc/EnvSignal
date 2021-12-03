class MarkersController < ApplicationController
  before_action :set_marker, only: %i[ show edit update upvote downvote destroy verify]
  before_action :authorize
  
  # GET /markers or /markers.json
  def index
    @markers = Marker.all
  end

  # GET /markers/1 or /markers/1.json
  def show
  end

  # GET /markers/new
  def new
    @marker = Marker.new
  end

  # GET /markers/1/edit
  def edit
  end

  # GET /markers/self
  def self
    @user = User.find_by(id: session[:user_id])

    if(@user != nil)
      @name = @user.name
      @markers = Marker.own_user(session[:user_id], 0)
    end
    @authority = Authority.find_by(id: session[:authority_id])
    if(@authority != nil)
      @name = @authority.name
      @markers = Marker.own_user(session[:authority_id], 1)
    end
    return render 'index'
  end

  # POST /markers or /markers.json
  def create
    @userId = session[:user_id]
    @authorityId = session[:authority_id]

    if @userId
      newParams = marker_params.merge!(:user_id => @userId, :verified => false, :user_type => 0)
    elsif 
      newParams = marker_params.merge!(:user_id => @authorityId, :verified => true, :user_type => 1)
    end
    puts newParams
    @marker = Marker.new(newParams)

    respond_to do |format|
      if @marker.save
        format.html { redirect_to @marker, notice: "Marker was successfully created." }
        format.json { render :show, status: :created, location: @marker }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @marker.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /markers/1 or /markers/1.json
  def update
    respond_to do |format|
      if (params[:marker][:severity])
        params[:marker][:severity] = params[:marker][:severity].to_i
      end
      if @marker.update(marker_edit_params)
        format.html { redirect_to @marker, notice: "Marker was successfully updated." }
        format.json { render :show, status: :ok, location: @marker }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @marker.errors, status: :unprocessable_entity }
      end
    end
  end

  def upvote
    @voter ||= Voter.find_by(user_id: current_user.id, marker_id: @marker.id)
    if @voter
      if @voter.upvote?
        @voter.destroy
        redirect_to @marker, notice: "Upvote removed"
      else
        @voter.upvote!
        redirect_to @marker, notice: "Upvoted succesfully (de-downvoted)"
      end
    else
      if Voter.new(user_id: current_user.id, marker_id: @marker.id, vote: :upvote).save
        redirect_to @marker, notice: "Upvoted succesfully"
      else
        redirect_to @marker, alert: "Failed to vote"
      end
    end
  end

  def downvote
    @voter ||= Voter.find_by(user_id: current_user.id, marker_id: @marker.id)
    if @voter
      if @voter.downvote?
        @voter.destroy
        redirect_to @marker, notice: "Downvote removed"
      else
        @voter.downvote!
        redirect_to @marker, notice: "Downvoted succesfully (de-upvoted)"
      end
    else
      if Voter.new(user_id: current_user.id, marker_id: @marker.id, vote: :downvote).save
        redirect_to @marker, notice: "Downvoted succesfully"
      else
        redirect_to @marker, alert: "Failed to vote"
      end
    end
  end

  def verify
    if authority_logged_in?
      if @marker.update(verified: true) 
        redirect_to @marker, notice: "Verified succesfully"
      else
        redirect_to @marker, alert: "Failed to verify"
      end
    end
  end

  # DELETE /markers/1 or /markers/1.json
  def destroy
    @marker.destroy
    respond_to do |format|
      format.html { redirect_to markers_url, notice: "Marker was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_marker
        @marker = Marker.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def marker_params
      params.require(:markers).permit(:disaster_type, :latitude, :longitude, :obs, :verified, :severity)
    end

    def marker_edit_params
      params.require(:marker).permit(:disaster_type, :latitude, :longitude, :obs, :verified, :severity)
    end
end

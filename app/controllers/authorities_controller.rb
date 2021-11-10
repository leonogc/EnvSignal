class AuthoritiesController < ApplicationController
    before_action :authority_block_access, except: [:destroy, :index, :list_disasters]
    before_action :authority_authorize, except: [:new, :create]

    def new
    end

    def create
        if !params[:identifier] or !params[:password] or params[:identifier] == '' or params[:password] == ''
            flash.alert = 'Identifier or Password not entered'
            render 'new'
        else
            @authority = Authority.find_by(identifier: params[:identifier])
            if @authority.present? && @authority.authenticate(params[:password])
                session[:authority_id] = @authority.id
                redirect_to :action => "index"
            else
                flash.alert = 'Incorrect identifier or password'
                render 'new'
            end
        end
    end

    def index
    end

    def destroy
        authority_sign_out
        redirect_to '/authorities/login'
    end

    def authority_sign_out
        session.delete(:authority_id)
        @current_authority = nil
    end

    def authority_block_access
        if authority_logged_in?
            redirect_to '/authorities'
        end
    end

    def current_authority
        @current_authority ||= Authority.find_by(id: session[:authority_id])
    end

    def authority_logged_in?
        !current_authority.nil?
    end

    def list_disasters
        @markers = Marker.all
    end

    def setLocation
        session[:latitude] = params[:latitude]
        session[:longitude] = params[:longitude]
    end
end

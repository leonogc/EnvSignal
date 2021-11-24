class AuthoritiesController < ApplicationController
    before_action :authority_block_access, except: [:destroy, :index]
    before_action :authority_authorize, except: [:new, :create, :list, :login, :check_login]
    before_action :admin_authorize, only: [:new, :create, :list]
    before_action :validate_authority_login, only: [:login, :check_login, :show]

    def new
        @authority = Authority.new
    end

    def create
        @authority = Authority.new(authorities_params)
        if @authority.save
            respond_to do |format|
                format.html { redirect_to controller: 'authorities', action: 'list'}
            end
        else
            render 'new'
        end
    end

    def index

    end

    def login
    end

    def check_login
        if params[:identifier] == '' or params[:password] == ''
            flash.alert = 'Identifier or Password not entered'
            render 'login'
        else
            @authority = Authority.find_by(identifier: params[:identifier])
            if @authority.present? && @authority.authenticate(params[:password])
                session[:authority_id] = @authority.id
                redirect_to "/authority"
            else
                flash.alert = 'Incorrect identifier or password'
                render 'login'
            end
        end
    end

    def destroy
        authority_sign_out
        redirect_to '/authorities/login'
    end

    def list
        @authorities = Authority.select(:identifier, :name)
    end

    def authority_sign_out
        session.delete(:authority_id)
        @current_authority = nil
    end

    def authority_block_access
        if authority_logged_in?
            redirect_to '/authority'
        end
    end

    def validate_authority_login
        if logged_in?
            redirect_to '/users/profile'
        end
    end


    private
    def authorities_params
        params.require(:authorities).permit(:identifier, :name, :password)
    end

end

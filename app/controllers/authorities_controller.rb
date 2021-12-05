class AuthoritiesController < ApplicationController
    before_action :authority_block_access, except: [:destroy, :show, :edit, :update]
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

    def show
        @authority = Authority.find_by(id: session[:authority_id])
    end

    def login
    end

    def check_login
        if params[:identifier] == '' or params[:password] == '' or !params[:identifier] or !params[:password]
            puts "aqui"
            flash.now.alert = 'Identifier or Password not entered'
            render 'login'
        else
            @authority = Authority.find_by(identifier: params[:identifier])
            if @authority.present? && @authority.authenticate(params[:password])
                session[:authority_id] = @authority.id
                redirect_to "/authority"
            else
                flash.now.alert = 'Incorrect identifier or password'
                puts "aqui2"
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

    def edit
        @authority = Authority.find_by(id: session[:authority_id])
    end
    
    def update
        @authority = Authority.find_by(id: session[:authority_id])
        if @authority.update(edit_params)
            flash.now.alert = 'Profile updated!'
            redirect_to '/authorities/profile'
        else
            render action: :edit
        end
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

    private
    def edit_params
        params.require(:authority).permit(:identifier, :name)
    end

end

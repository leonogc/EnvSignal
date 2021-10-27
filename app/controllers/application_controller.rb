class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    include SessionsHelper

    def authorize
        unless logged_in?
            redirect_to login_path
        end
    end

    def authority_authorize
        unless authority_logged_in?
            redirect_to '/authorities/login'
        end
    end
end

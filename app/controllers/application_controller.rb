class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception

    def current_user
        @current_user ||= User.find_by(id: session[:user_id])
      end
    
    def logged_in?
        !current_user.nil?
    end

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
  
    def block_access
        if logged_in?
          redirect_to '/profile'
        end
    end
end

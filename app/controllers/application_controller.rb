class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception

    def current_user
        @current_user ||= User.find_by(id: session[:user_id])
      end
    
    def logged_in?
        !current_user.nil?
    end

    def user_authorize
        unless logged_in?
            redirect_to '/users/login'
        end
    end

    def authorize
        unless logged_in? || authority_logged_in?
            redirect_to '/users/login'
        end
    end

    def authority_authorize
        unless authority_logged_in?
            redirect_to '/authorities/login'
        end
    end
    
    def current_authority
        @current_authority ||= Authority.find_by(id: session[:authority_id])
    end

    def authority_logged_in?
        !current_authority.nil?
    end
    
    def admin_authorize
        unless admin_logged_in?
            redirect_to '/admin/login'
        end
    end

    def current_admin
        @current_admin ||= Admin.find_by(id: session[:admin_id])
    end

    def admin_logged_in?
        !current_admin.nil?
    end
  
    def block_access
        if logged_in?
          redirect_to '/users/profile'
        end
    end

end

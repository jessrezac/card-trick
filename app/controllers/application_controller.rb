class ApplicationController < ActionController::Base
    protect_from_forgery

    def current_user
        User.find(session[:user_id])
    end

    def logged_in?
        session.include?(:user_id)
    end

    def require_login
        unless logged_in?
            redirect_to root_path
        end
    end

    helper_method :current_user
    helper_method :logged_in?
    helper_method :require_login
    helper_method :restrict_to_owner
end

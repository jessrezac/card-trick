class ApplicationController < ActionController::Base
    protect_from_forgery

    def current_user
        User.find(session[:user_id])
    end

    def logged_in?
        !!session.include?(:user_id)
    end

    def require_log_in
        unless logged_in?
            redirect_to login_path
        end
    end

    helper_method :current_user
    helper_method :logged_in?
    helper_method :require_log_in
end

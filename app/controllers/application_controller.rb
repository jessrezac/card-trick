class ApplicationController < ActionController::Base

    def current_user
        User.find(session[:user_id])
    end

    def logged_in?
        session.include?(:user_id)
    end

    helper_method :current_user
    helper_method :logged_in?
end

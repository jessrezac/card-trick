class SessionsController < ApplicationController

    def new
    end

    def create
        @user = User.find_by(email: params[:email])
        
        if @user && @user.authenticate(params[:password])
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            redirect_to login_path
        end
    end

    def create_from_google
        @user = User.find_or_create_by(email: auth.info.email) do |u|
            u.name = auth.info.name
            u.password = SecureRandom.hex if u.password == nil
        end

        @user.google_token = auth.credentials.token
        refresh_token = auth.credentials.refresh_token
        @user.google_refresh_token = refresh_token if refresh_token.present?
        @user.save

        session[:user_id] = @user.id
        redirect_to user_path(@user)
    end

    def destroy
        session.delete(:user_id)
        redirect_to login_path
    end

    private

    def auth
        request.env["omniauth.auth"]
    end
end

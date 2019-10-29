class UsersController < ApplicationController
    before_action :set_user, only: [:show, :edit, :update, :destroy]

    def index
    end

    def new
        @user = User.new
    end

    def create
        @user = User.create(user_params)

        if @user.save
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            render "/users/new"
        end
    end

    def show
    end

    def edit
    end

    def update
    end

    def destroy
        @user.destroy
        redirect_to root_path
    end

    private

    def user_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation, :google_token, :google_refresh_token)
    end

    def set_user
        @user = User.find(params[:id])
    end

end

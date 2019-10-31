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
            render new_user_path
        end
    end

    def show
    end

    def edit
    end

    def update
        @user.update(user_params)

        if @user.save
            redirect_to user_path(@user)
        else
            render edit_user_path(@user)
        end
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

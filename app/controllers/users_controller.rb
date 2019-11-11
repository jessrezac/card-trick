class UsersController < ApplicationController
    before_action :set_user, only: [:show, :edit, :update, :destroy]
    before_action :authorize_user, only: [:show, :edit, :update, :destroy]

    def index
        redirect_to user_path(current_user)
    end

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)

        if @user.valid?
            @user.save
            session[:user_id] = @user.id
            redirect_to stacks_path
        else
            render "new"
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
            render "edit"
        end
    end

    def destroy
        @user.destroy
        session[:user_id].delete
        redirect_to root_path
    end

    private

    def user_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation, :google_token, :google_refresh_token)
    end

    def set_user
        @user = User.find(params[:id])
    end

    def authorize_user
        unless @user == current_user
            redirect_to user_path(current_user)
        end
    end

end

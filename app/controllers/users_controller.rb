class UsersController < ApplicationController

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)

        if @user.save
            set_current_user
            redirect_to @user
        else
            render :new
        end
    end

    def show
        if !session[:user_id].nil?
            find_user
        else
            redirect_to root_path
        end
    end

    private

    def user_params
        params.require(:user).permit(:email, :name, :password, :password_confirmation)
    end
end

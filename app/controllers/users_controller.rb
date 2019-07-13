class UsersController < ApplicationController

    def home
    end

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)

        if @user.save
            session[:user_id] = @user.id
            redirect_to @user
        else
            render :new
        end
    end

    def show
        if !session[:user_id].nil?
            @user = User.find(params[:id])
        else
            redirect_to root_path
        end
    end

    private

    def user_params
        params.require(:user).permit(:username, :first_name, :last_name, :password, :password_confirmation)
    end
end

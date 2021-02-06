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
        if logged_in?
            find_user
            cookies[:user_id] = @user.id
            @sorted_reservations = Reservation.sort_reservation(@user.reservations)
            respond_to do |format|
                format.html
                format.json {render json: @user}
            end
        else
            redirect_to root_path
        end
    end

    private
    def user_params
        params.require(:user).permit(:email, :name, :password, :password_confirmation)
    end
end

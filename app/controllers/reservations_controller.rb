class ReservationsController < ApplicationController
    before_action :find_reservation, only: [:update, :edit, :show]
    before_action :find_user, only: [:edit, :new]

    def new
        @reservation = Reservation.new   
        @equipment = Equipment.find(params[:equipment_id]) if params[:equipment_id]
    end

    def create
        @reservation = Reservation.new(reservation_params)
        @reservation.user_id = session[:user_id]
        @reservation.equipment_id = Equipment.find(params[:equipment][:id]).id if params[:equipment][:id]

        if @reservation.save
            redirect_to reservation_path(@reservation)
        else
            render :new
        end
    end

    def show
       @equipment = @reservation.equipment if @reservation.equipment
    end

    def edit
        @equipment = @reservation.equipment 
    end

    def update
        @reservation.equipment = Equipment.find(params[:equipment][:id])
        @reservation.update(reservation_params)
        
        redirect_to reservation_path(@reservation)
    end

    def destroy
    end

    private

    def reservation_params
        params.require(:reservation).permit(:date, :start_time, :end_time, :equipment_id)
    end

    def find_reservation
        @reservation = Reservation.find(params[:id])
    end

    def find_user
        @user = User.find(session[:user_id])
    end
end

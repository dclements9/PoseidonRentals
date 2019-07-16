class ReservationsController < ApplicationController

    def new
        @reservation = Reservation.new
        @equipment = Equipment.find(params[:equipment_id]) if params[:equipment_id]
        @user = User.find(session[:user_id])
    end

    def create
        
        @reservation = Reservation.new(reservation_params)
        @reservation.user_id = session[:user_id]
        @reservation.equipment_id  = params[:equipment][:id]

        if @reservation.save
            redirect_to reservation_path(@reservation)
        else
            render :new
        end
    end

    def show
        @reservation = Reservation.find(params[:id])
        @equipment = Equipment.find(@reservation.equipment_id) if @reservation.equipment_id
    end

    def edit
        @reservation = Reservation.find(params[:id])
    end

    def destroy
    end

    private

    def reservation_params
        params.require(:reservation).permit(:date, :start_time, :end_time)
    end
end

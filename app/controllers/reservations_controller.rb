class ReservationsController < ApplicationController
    before_action :find_reservation, only: [:update, :edit, :show]
    before_action :find_user, only: [:edit, :new]
    before_action :set_equipment_id, only: [:new, :create]

    def new
        @reservation = Reservation.new      
    end

    def create
        @reservation = Reservation.new(reservation_params)
        @reservation.user_id = session[:user_id]
        
        if @reservation.save
            redirect_to reservation_path(@reservation)
        else
            render :new
        end
    end

    def show
        @equipment = Equipment.find(@reservation.equipment_id) if @reservation.equipment_id
    end

    def edit
        @equipment = Equipment.find(@reservation.equipment_id) 
    end

    def update
        @equipment = Equipment.find(params[:equipment_id])
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

    def set_equipment_id
        @equipment = Equipment.find(params[:equipment_id]) if params[:equipment_id]
    end
end

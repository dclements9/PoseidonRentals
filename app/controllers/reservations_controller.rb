class ReservationsController < ApplicationController

    def new
        @reservation = Reservation.new
        @equipment = Equipment.find(params[:equipment_id])
    end

    def create
        @reservation = Reservation.new()
    end

    def show
        @reservation = Reservation.find(params[:id])
    end
end

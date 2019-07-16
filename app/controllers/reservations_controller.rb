class ReservationsController < ApplicationController

    def new
        @reservation = Reservation.new
        @equipment = Equipment.find(params[:equipment_id]) if params[:equipment_id]
        @user = User.find(session[:user_id])
    end

    def create
        binding.pry
        @equipment = Equipment.find_by(name: params[:equipment][:name])
        @reservation = Reservation.new()
    end

    def show
        @reservation = Reservation.find(params[:id])
    end

    def edit
        @reservation = Reservation.find(params[:id])
    end

    def destroy
    end
end

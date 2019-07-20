class ReservationsController < ApplicationController
    before_action :find_reservation, only: [:update, :edit, :show]
    before_action :find_user, only: [:edit, :new]
    before_action :is_owner?, only: [:show, :edit, :destroy]

    def new
        @reservation = Reservation.new   
        @equipment = Equipment.find(params[:equipment_id]) if params[:equipment_id]
    end

    def create
        @reservation = Reservation.new(reservation_params)
        @reservation.user_id = session[:user_id]
        @reservation.equipment_id = Equipment.find(params[:equipment][:id]).id if !params[:equipment][:id].empty?
        
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
        @reservation.find(params[:id])
        @reservation.destroy
        
        redirect_to root_path
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

    def is_owner?
        if @reservation.user_id != session[:user_id]
            redirect_to root_path
        end
    end
end

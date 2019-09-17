class ReservationsController < ApplicationController
    before_action :find_reservation, only: [:update, :edit, :show, :destroy]
    before_action :find_user, only: [:edit]
    before_action :is_owner?, only: [:show, :edit, :destroy]

    def new
    
        if logged_in?
            find_user 
            @reservation = Reservation.new   
            @equipment = Equipment.find(params[:equipment_id]) if params[:equipment_id]
        else
            redirect_to root_path
        end
    end

    def create
        @reservation = Reservation.new(reservation_params)
        @reservation.user = current_user
        @reservation.equipment = Equipment.find(params[:equipment][:id]) if !params[:equipment][:id].empty?
        
        if @reservation.save
            redirect_to reservation_path(@reservation)
        else
            render :new
        end
    end

    def show
        @equipment = @reservation.equipment if @reservation.equipment
        respond_to do |format|
            format.html
            format.json {render json: @reservation}
        end
    end

    def edit
        @equipment = @reservation.equipment 
    end

    def update
        @reservation.equipment = Equipment.find(params[:equipment][:id])
        @reservation.update(reservation_params)
        
        redirect_to reservation_path(@reservation)
    end

    def index
        
        if !params[:equipment_id].nil?
            @equipment = Equipment.find(params[:equipment_id]) 
            @reservations = @equipment.reservations
        else 
            @reservations = Reservation.all
            respond_to do |format|
                format.html
                format.json {render json: @reservations}
            end
        end
    end

    def destroy
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

    def is_owner?
        if @reservation.user_id != session[:user_id]
            redirect_to root_path
        end
    end
end

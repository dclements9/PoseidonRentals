class ApplicationController < ActionController::Base
    helper_method :reservation_date, :reservation_start, :reservation_end, :equipment_currency, :current_user

    def reservation_date(reservation)
        Reservation.date(reservation)
    end

    def reservation_start(reservation)
        Reservation.start_time(reservation)
    end

    def reservation_end(reservation)
        Reservation.end_time(reservation)
    end

    def current_user
        @current_user ||= User.find(session[:user_id])
    end
end

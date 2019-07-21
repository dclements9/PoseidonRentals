class ApplicationController < ActionController::Base
    helper_method :reservation_date, :reservation_start, :reservation_end, :current_user, :set_current_user, :find_user, :logged_in?

    def reservation_date(reservation)
        Reservation.date(reservation)
    end

    def reservation_start(reservation)
        Reservation.start_time(reservation)
    end

    def reservation_end(reservation)
        Reservation.end_time(reservation)
    end

    def find_user
        @user = User.find(session[:user_id])
    end

    def current_user
        @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end

    def set_current_user
        session[:user_id] = @user.id
    end
    
    def logged_in?
        current_user != nil
    end 
end

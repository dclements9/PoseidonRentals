class Reservation < ApplicationRecord
    belongs_to :user
    belongs_to :equipment

    def self.start_time(reservation)
        reservation.start_time.strftime("%-l:%M%P")
    end

    def self.end_time(reservation)
        reservation.end_time.strftime("%-l:%M%P")
    end

    def self.date(reservation)
        reservation.date.strftime("%b %-d, %Y")
    end
end

class Reservation < ApplicationRecord
    belongs_to :user
    belongs_to :equipment
    validates :equipment_id, :date, :start_time, :end_time, presence: true
    validate :start_time_before_end_time
    validate :date_time_in_future

    def self.start_time(reservation)
        reservation.start_time.strftime("%-l:%M%P")
    end

    def self.end_time(reservation)
        reservation.end_time.strftime("%-l:%M%P")
    end

    def self.date(reservation)
        reservation.date.strftime("%b %-d, %Y")
    end

    def start_time_before_end_time
        if self.start_time > self.end_time
            errors.add(:start_time, "cannot be after Return time")
        end
    end

    def date_time_in_future
        if date.past? 
            errors.add(:date, "cannot be in the past")
        elsif date == Date.today && self.start_time.strftime("%H:%M") < Time.now.strftime("%H:%M") 
            errors.add(:date, "and start time cannot be in the past")
        end
    end

    def self.sort_reservation(reservations)
        reservations.sort_by{|r| [r.date, r.start_time.strftime("%H:%M")]}
    end
end
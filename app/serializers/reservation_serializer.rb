class ReservationSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :date, :start_time, :end_time
end

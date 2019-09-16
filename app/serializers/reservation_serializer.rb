class ReservationSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :date, :start_time, :end_time
  belongs_to :equipment
  belongs_to :user
end

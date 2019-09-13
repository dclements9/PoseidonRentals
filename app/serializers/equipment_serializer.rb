class EquipmentSerializer < ActiveModel::Serializer
  attributes :id, :name, :category, :available, :cost
  has_many :reservations
end

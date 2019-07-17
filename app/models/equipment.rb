class Equipment < ApplicationRecord
    has_many :reservations
    has_many :users, through: :reservations

    scope :available, -> { where(available: true) }
end

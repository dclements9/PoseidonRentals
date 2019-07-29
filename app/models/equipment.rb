class Equipment < ApplicationRecord
    has_many :reservations
    has_many :users, through: :reservations
    validates :name, :category, :available, :cost, presence: true

    scope :available, -> { where(available: true) }

    def name_cost
        "#{name} - #{ActionController::Base.helpers.number_to_currency(cost)}/hr"
    end
end

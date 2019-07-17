class Equipment < ApplicationRecord
    has_many :reservations
    has_many :users, through: :reservations

    def cost_currency(cost)
        
        number_to_currency(cost)
    end
end

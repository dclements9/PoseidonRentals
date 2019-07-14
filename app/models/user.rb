class User < ApplicationRecord
    has_secure_password
    has_many :reservations
    has_many :equipment, through: :reservations

    validates :email, presence: true, uniqueness: true
    validates :name, presence: true
    validates :password, presence: true

end

class User < ApplicationRecord
    has_secure_password
    has_many :reservations
    has_many :equipment, through: :reservations

    validates :email, presence: true, uniqueness: true
    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :password, presence: true

end

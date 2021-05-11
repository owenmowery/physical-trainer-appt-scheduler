class Trainer < ApplicationRecord
    has_secure_password
    has_many :appointments
    has_many :clients, through: :appointments
end

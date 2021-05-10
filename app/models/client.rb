class Client < ApplicationRecord
    has_many :appointments
    has_many :trainers, through: :appointments

    validates :client_email, uniqueness: true, presence: true
end

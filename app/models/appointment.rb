class Appointment < ApplicationRecord
    belongs_to :client
    belongs_to :trainer

    scope :upcoming_appointments, ->(time) { where('appt_datetime > ?', time) }
end

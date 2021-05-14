module ClientsHelper
    def find_appointments(client)
        @appointments = Appointment.find_by_id(client.id)
    end
end

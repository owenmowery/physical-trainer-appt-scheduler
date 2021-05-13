class AppointmentsController < ApplicationController
    def new
    end

    def create
        if logged_in?
            @appointment = Appointment.new(appt_params)
            trainer = Trainer.find_by_name(params_trainer_name[:trainer_name])
            @appointment.trainer_id = trainer.id 
            if @appointment.save
                redirect_to client_appointment_path(@appointment)
            else
                flash[:error] = "Appointment schedule was unsuccessful, please try again."
                redirect_to clients_path
            end
        else
            redirect_to client_login_path
        end

    end

    def show

    end

    private

    def appt_params
        params.permit(:appt_datetime, :client_id)
    end

    def params_trainer_name
        params.permit(:trainer_name)
    end
end

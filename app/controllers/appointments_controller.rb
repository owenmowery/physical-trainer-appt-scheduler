class AppointmentsController < ApplicationController

    def index

    end

    def show
        @appointment = Appointment.find_by_id(params[:id])
        @client = Client.find_by_id(@appointment.client_id)
    end
   
    def new
        find_client
        @appointment = @client.appointments.build
    end

    def create
        if logged_in?
            @appointment = Appointment.new(appt_params)
            find_client
            trainer = Trainer.find_by_name(params_trainer_name[:trainer_name])
            @appointment.trainer_id = trainer.id
            @appointment.client_id = params[:client_id]
            if @appointment.save
                redirect_to client_appointment_path(@appointment, @client)
            else
                flash[:error] = "Appointment schedule was unsuccessful, please try again."
                redirect_to clients_path
            end
        else
            redirect_to client_login_path
        end

    end

    def edit
        @appointment = Appointment.find_by_id(params[:id])
        find_client
    end

    def update
        @appointment = Appointment.find_by_id(params[:id])
        find_trainer
        binding.pry
        @appointment.trainer_id = @trainer.id
        @appointment.update(update_params)
        binding.pry
    end

    private

    def find_client
        @client = Client.find_by_id(params[:client_id])
    end

    def find_trainer
        @trainer = Trainer.find_by_name(params[:appointment][:trainer])
    end

    def update_params
        params.require(:appointment).permit(:appt_datetime)
    end
        
    def appt_params
        params.require(:client).permit(:appt_datetime, :client_id)
    end

    def params_trainer_name
        params.require(:client).permit(:trainer_name)
    end
end

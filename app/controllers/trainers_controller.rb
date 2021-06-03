class TrainersController < ApplicationController
    def signup
    end

    def create
        @trainer = Trainer.new(trainer_params)
        if @trainer.save
            session[:trainer_id] = @trainer.id
            redirect_to trainers_path
        else
            redirect_to trainer_signup_path
        end
    end

    def index
        @trainer = Trainer.find_by_id(session[:trainer_id])
        @appointments = @trainer.appointments
        @upcoming_appointments = Appointment.upcoming_appointments(Time.now.midnight)
        @sorted_appts = sort_by_date(@upcoming_appointments)
    end

    private

    def sort_by_date(arr)
        arr.sort_by {|h| h['appt_datetime']}
    end

    def trainer_params
        params.permit(:name, :trainer_email, :gym_name, :password)
    end
end

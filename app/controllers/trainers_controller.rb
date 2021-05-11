class TrainersController < ApplicationController
    def signup
        
    end

    def create
        @trainer = Trainer.create(trainer_params)
        if @trainer
            session[:trainer_id] = @trainer.id
            redirect_to trainers_path
        else
            redirect_to trainer_signup_path
        end
    end

    private

    def trainer_params
        params.permit(:name, :trainer_email, :gym_name)
    end
end

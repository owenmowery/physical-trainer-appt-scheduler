class SessionsController < ApplicationController
    
    def client_login
        @client = Client.find_by(client_email: params[:client_email])
        if @client && @client.authenticate(params[:password])
            session[:client_id] = @client.id
            redirect_to clients_path
        else
            redirect_to client_login_path
        end
    end

    def trainer_login
        @trainer = Trainer.find_by(trainer_email: params[:trainer_email])
        if @trainer && @trainer.authenticate(params[:password])
            session[:trainer_id] = @trainer.id
            redirect_to trainers_path
        else
            redirect_to trainer_login_path
        end
    end

end
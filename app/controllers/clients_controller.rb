class ClientsController < ApplicationController
    def signup
    end

    def login 
    end

    def create
        @client = Client.new(client_params)
        if @client.save
            session[:client_id] = @client.id
            redirect_to clients_path
        else
            redirect_to client_signup_path
        end
    end

    private

    def client_params
        params.permit(:name, :client_email, :age, :height, :weight, :goal, :password)
    end
end

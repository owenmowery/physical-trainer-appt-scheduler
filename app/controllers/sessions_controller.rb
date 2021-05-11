class SessionsController < ApplicationController
    def create
        @client = Client.create(client_params)
        if @client
            session[:client_id] = @client.id
            redirect_to clients_path
        else
            redirect_to client_signup_path
        end
    end

    def login
        @client = Client.find_by(client_email: params[:client_email])
        binding.pry
        if @client && @client.authenticate(client_params[:password])
            session[:client_id] = @client.id
            redirect_to clients_path
        else
            #redirect_to client_login_path
        end
    end

    private

    def client_params
        params.permit(:name, :client_email, :age, :height, :weight, :goal, :password, :password_confirmation)
    end
end
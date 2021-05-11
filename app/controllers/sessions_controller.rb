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
        if @client && @client.authenticate(params[:password])
            session[:client_id] = @client.id
            redirect_to clients_path
        else
            redirect_to client_login_path
        end
    end

end
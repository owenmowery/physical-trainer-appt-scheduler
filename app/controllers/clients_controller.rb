class ClientsController < ApplicationController
    def signup
    end

    def create
        @client = Client.new(client_params)
        render 'clients/index'
    end

    def client_params
        params.permit(:name, :client_email, :age, :height, :weight, :goal, :password_digest)
    end
end

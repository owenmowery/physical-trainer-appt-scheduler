class ClientsController < ApplicationController
    def signup
    end

    def login
        
    end

    def client_params
        params.permit(:name, :client_email, :age, :height, :weight, :goal, :password_digest)
    end
end

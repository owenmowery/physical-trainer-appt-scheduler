class ClientsController < ApplicationController

    def signup
    end

    def login 
    end

    def index
        if logged_in?
            @client = current_user
            @appointment = Appointment.find_by_id(@client.id)
        else
            redirect_to client_login_path
        end
    end

    def show
        @client = current_user
    end

    def new
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

    def find_client
        @client = Client.find_by_id(params[:id])
    end
end

module SessionsHelper
    def logged_in?
        !!session[:client_id]
    end

    def current_user
        @client ||= Client.find_by_id(session[:client_id])
    end
end
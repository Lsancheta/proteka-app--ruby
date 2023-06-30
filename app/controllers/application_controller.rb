class ApplicationController < ActionController::Base
    before_action :authenticate_user

    private

    def authenticate_user
        unless current_user
            flash[:notice] = "Faça login para acessar esta página."
            redirect_to login_path
        end
    end

    def current_user
        @current_user ||= Usuario.find_by(token: session[:token]) #request.headers['Authorization'])
    end

    helper_method :current_user
end

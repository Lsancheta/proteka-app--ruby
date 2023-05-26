module SessionsHelper
    def sign_in
        session[:usuario_id] = usuario.id
    end

    def current_user
        @current_user ||= Usuario.find_by(id: session[:usuario_id])
    end
    def block_access
        if current_user.present?
            redirect_to usuarios_path
        end
    end

    def logged_in?
        !current_user.nil?
    end

    def sign_out
            session.delete(:usuario_id)
            @current_user= nil
    end
end

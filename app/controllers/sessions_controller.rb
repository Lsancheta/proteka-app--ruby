
class SessionsController < ApplicationController
  skip_before_action :require_login, only: [:create, :new]
  
  def new
    # Renderiza o formulário de login
  end

  def create
    session_params = params.permit(:email, :password )
    @user = Usuario.find_by(email: session_params[:email])

    if @user && @user.authenticate(session_params[:password])
      session[:user_id] = @user.id
      redirect_to root_path
      puts @user.id
    else
      flash[:notice] = "Senha ou email incorretos"
      render :new
    end
  end

  def destroy
    user = Usuario.find_by(email: params[:email])
    session[:user_id] = nil
    flash[:notice] = "You have been signed out!"
    redirect_to new_session_path
  end
end

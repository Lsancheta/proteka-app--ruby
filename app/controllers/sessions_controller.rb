require  'jwt'
class SessionsController < ApplicationController

  def new
    
  end
  def create
    user = Usuario.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      token = generate_token(user)
      user.update(token: token)
      redirect_to root_path
      puts session[:token]
    else
      flash.now[:error] = "Senha ou email incorretos"
      render :new
    end
  end

  def destroy
    current_user.update(token: nil)
    redirect_to login_path
  end


  private

  def generate_token(user)
    payload = {user_id: user.id}
    secret_key = Rails.application.secrets.secret_key_base
    algorithm = 'HS256'
    JWT.encode(payload, secret_key, algorithm) 
  end
  
end

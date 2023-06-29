class SessionsController < ApplicationController

  def sign_in_params
    params.require(:usuario).permit(:email, :password)
  end

  def create
    @usuario = Usuario.find_by(re: params[:session][:email])
      if @usuario && @usuario.authenticate(params[:session][:password])
            sign_in (@usuario)
        redirect_to @usuario
      else
        render 'new'
      end
  end

  def destroy
    sign_out
    redirect_to root_url
  end

end

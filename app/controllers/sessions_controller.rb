class SessionsController < ApplicationController
  #before_action :block_access, except: [:destroy]

  def create
    @usuario = Usuario.find_by(re: params[:session][:re])
      if @usuario && @usuario.authenticate(params[:session][:senha])
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

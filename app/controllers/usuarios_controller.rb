class UsuariosController < ApplicationController
  def index
    @usuario = Usuario.all
  end

  def show
    @usuario = Usuario.find(params[:id])
  end

  def new
    @usuario = Usuario.new
  end

  def create
    @usuario = Usuario.new(usuario_params)

    if @usuario.save
      redirect_to usuarios_path, notice: "Usuário Cadastrado com Sucesso"
    else
      puts @usuario.errors.full_messages
      flash.now[:alert] = "Erro ao cadastrar usuário!"
      render 'new'
    end
  end

  def edit
    @usuario = Usuario.find(params[:id])
  end

  def update
    @usuario = Usuario.find(params[:id])

    if @usuario.update(usuario_params)
      redirect_to usuarios_path, notice:"Usuario atualizado com sucesso"
    else
      render 'edit'
    end
  end

  def destroy
    @usuario = Usuario.find(params[:id])
    @usuario.destroy
    redirect_to usuarios_path, notice:"Usuario deletado com sucesso"
  end

  private
  def usuario_params
    params.require(:usuario).permit(:re, :nome, :email, :password)
  end
end

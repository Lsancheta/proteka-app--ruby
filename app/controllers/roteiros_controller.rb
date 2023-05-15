class RoteirosController < ApplicationController
    def index
      @roteiros = Roteiro.all
      @usuarios = Usuario.all
      @postos = Posto.all
    end
  
    def new
      @roteiro = Roteiro.new
      @usuarios = Usuario.all
      @postos = Posto.all
      #@usuarios = Usuario.joins(:roteiros).select(:id, :nome).distinct
      #@postos = Posto.joins(:roteiros).select(:id, :cliente).distinct
    end
  
    def create
      @roteiro = Roteiro.new(roteiro_params)
      @usuario = Usuario.find(params[:roteiro][:usuario_id])
      @posto = Posto.find(params[:roteiro][:posto_id])

      #@roteiro.usuario = @usuario
      #@roteiro.posto = @posto

      if @roteiro.save
        redirect_to roteiros_path, notice: "Roteiro criado com sucesso!"
      else
        render :new
      end
    end

    def edit
      @roteiro = Roteiro.find(params[:id])
      @posto = @roteiro.posto
      @usuarios = Usuario.all #para ver todos os usuarios

    end

    def update
      @roteiro = Roteiro.find(params[:id])

      if @roteiro.update(roteiro_params)
        redirect_to roteiros_path, notice: "Roteiro Editado com sucesso!!"
      else
        render :edit
      end
    end

  
    private
  
    def roteiro_params
      params.require(:roteiro).permit(:nome, :usuario_id, :posto_id)
    end
  end
  
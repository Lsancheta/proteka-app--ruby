class RoteirosController < ApplicationController
    def index
      @roteiros = Roteiro.all
      @postos = Posto.all
    end
  
    def new
      @roteiro = Roteiro.new
      @usuarios = Usuario.all
      @postos = Posto.all
    end

    def create
      @roteiro = Roteiro.new(roteiro_params)
      @posto = Posto.find(params[:roteiro][:posto_id])
      @roteiro.usuarios = Usuario.where(id: params[:roteiro][:usuario_ids].reject!(&:blank?))

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
      @roteiro.usuarios.build #build a new associated usuarios
    end

    def update
      @roteiro = Roteiro.find(params[:id])
        
      if @roteiro.update(roteiro_params)
        redirect_to roteiros_path, notice: "Roteiro Editado com sucesso!!"
      else
        render :edit
      end
    end
    
    def destroy

      @roteiro = Roteiro.find(params[:id])
      @roteiro.destroy

      redirect_to roteiros_path, notice: "Roteiro deletado com sucesso!!"
    end
  
    private
  
    def roteiro_params
      params.require(:roteiro).permit(:nome, :posto_id, usuario_ids:[])
    end
  end
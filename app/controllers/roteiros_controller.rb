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
      @roteiro.usuarios.build #build a new associated usuarios
      #@usuarios = Usuario.joins(:roteiros).select(:id, :nome).distinct
      #@postos = Posto.joins(:roteiros).select(:id, :cliente).distinct
    end
  
    def create
      @roteiro = Roteiro.new(roteiro_params)
      @usuario = Usuario.find(roteiro_params[:usuario_id])
      #@usuario = Usuario.find(params[:roteiro][:usuario_id])
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
      @roteiro.usuarios.build #build a new associated usuarios
      #puts @posto.inspect
      #puts @usuarios.inspect

    end

    def update
      @roteiro = Roteiro.find(params[:id])
    
      #puts "Params: #{params.inspect}"
      #puts "Usuario ID: #{params[:roteiro][:usuario_id]}"
      #puts "Posto ID: #{params[:roteiro][:posto_id]}"
    
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
      params.require(:roteiro).permit(:nome, :usuario_id, :posto_id)
    end
  end
  
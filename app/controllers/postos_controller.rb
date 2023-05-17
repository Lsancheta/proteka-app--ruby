class PostosController < ApplicationController
  def index
    @posto = Posto.all
  end
  
  def show
    @posto = Posto.find(params[:id])
  end

  def new
    @posto = Posto.new
    @checklist = Checklist.all
  end

  def create
    @posto = Posto.new(posto_params)

      # You can use the 'checklist_ids' parameter to retrieve the selected checklists from the form
    selected_checklist = Checklist.find(params[:posto][:checklist_ids])

    # You can then add the checklist to te new posto
    #@posto.checklists << selected_checklist
    @posto.checklist_id = params[:posto][:checklist_ids]

    if @posto.save
      redirect_to postos_path, notice:"Posto cadastrado com sucesso!"
    else 
      render :new
    end
  end

  def edit
    @checklist = Checklist.all
    #@posto = Posto.find(params[:id])
    @posto = Posto.includes(:checklists).find(params[:id])

  end

  def update
    @posto = Posto.find(params[:id])
    selected_checklist_ids = params[:posto][:checklist_ids]

    if @posto.update(posto_params)
      @posto.checklists.replace(Checklist.where(id: selected_checklist_ids))
        
      redirect_to postos_path, notice:"Posto Atualizado com sucesso"
    else
      render 'edit'
    end
  end
    
  def destroy
    #puts "Esse e o params[:id]: #{params[:id]}"
    @posto = Posto.find(params[:id])
    #esse codigo abaixo vai fazer uma disassociação com a tabela roteiros
    @posto.roteiros.clear


    if @posto.destroy
      redirect_to postos_path, notice:"Posto deletado com sucesso!"
    else
      redirect_to postos_path, notice: "Erro ao deletar o Posto!"
    end
  end

  private
  def posto_params
    params.require(:posto).permit(:cliente, :checklist_id, checklist_ids: [])
  end
end
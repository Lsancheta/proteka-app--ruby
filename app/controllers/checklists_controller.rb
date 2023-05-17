class ChecklistsController < ApplicationController
    
    def index
        @checklist = Checklist.all
      end

    def show
        @checklist = Checklist.find(params[:id])
      end

    def new
        @checklist = Checklist.new
        @tarefa = Tarefa.all
    end     
      

    def create
        @checklist = Checklist.new(checklist_params)
        @checklist.tarefas = Tarefa.find(params[:checklist][:tarefa_ids].split(","))

        if @checklist.tarefas.empty?
          flash[:error] = "É NECESSÁRIO RESCOLHER PELO MENOS UMA TAREFA!"
          render :new
        else
          if @checklist.save
            tarefa_ids = params[:checklist][:tarefa_ids].split(",")

            tarefa_ids.each do |tarefa_id|
              @checklist.checklist_tarefas.create(tarefa_id: tarefa_id) if tarefa_id.present?
            end

            redirect_to checklists_path, notice: "CHECKLIST CRIADO COM SUCESSO!!"
          else
            render :new
          end
        end
      end

    def edit
        @tarefa = Tarefa.all
        @checklist = Checklist.includes(:tarefas).find(params[:id])
    end

    def update
        @checklist = Checklist.find(params[:id])
        @checklist.tarefas = Tarefa.find(params[:checklist][:tarefa_ids].split(","))

        if @checklist.update(checklist_params)
            redirect_to checklists_path, notice: "Checklist Atualizado com Sucesso"
        else
            render 'edit'
        end
    end

    def destroy
        @checklist = Checklist.find(params[:id])
        #@checklist_tarefas = checklist_tarefas.find(params[:checklist_tarefas])
        ActiveRecord::Base.transaction do
          @checklist.checklist_tarefas.destroy_all 
          @checklist.destroy

        redirect_to checklists_path, notice:"Checklist deletado com sucesso"
    end

  rescue ActiveRecord::InvalidForeignKey
    redirect_to checklists_path, alert: "Não pode se excluído por conta da associação ao banco de dados"
  end

    private
    def checklist_params
        params.require(:checklist).permit(:name, tarefa_ids: [])
    end
end

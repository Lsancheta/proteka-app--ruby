class TarefasController < ApplicationController
  before_action :require_login
  helper_method :current_user
  
  # GET /tarefas or /tarefas.json
  def index
    @tarefas = Tarefa.all
  end

  # GET /tarefas/1 or /tarefas/1.json
  def show
    @tarefa = Tarefa.find(params[:id])
  end

  # GET /tarefas/new
  def new
    @tarefa = Tarefa.new
  end

  # GET /tarefas/1/edit
  def edit
    @tarefa = Tarefa.find(params[:id])
  end

  # POST /tarefas or /tarefas.json
  def create
    @tarefa = Tarefa.new(tarefa_params)

    respond_to do |format|
      if @tarefa.save
        format.html { redirect_to tarefa_url(@tarefa), notice: "Tarefa was successfully created." }
        format.json { render :show, status: :created, location: @tarefa }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @tarefa.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tarefas/1 or /tarefas/1.json
  def update
    @tarefa = Tarefa.find(params[:id])
    respond_to do |format|
      if @tarefa.update(tarefa_params)
        format.html { redirect_to tarefa_url(@tarefa), notice: "Tarefa was successfully updated." }
        format.json { render :show, status: :ok, location: @tarefa }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @tarefa.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tarefas/1 or /tarefas/1.json
  def destroy
    @tarefa = Tarefa.find(params[:id])
    @tarefa.destroy

    respond_to do |format|
      format.html { redirect_to tarefas_url, notice: "Tarefa was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tarefa
      @tarefa = Tarefa.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def tarefa_params
      params.require(:tarefa).permit(:titulo, :descricao)
    end
end

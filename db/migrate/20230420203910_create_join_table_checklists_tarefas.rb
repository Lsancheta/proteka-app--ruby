class CreateJoinTableChecklistsTarefas < ActiveRecord::Migration[7.0]
  def change
    create_join_table :checklists, :tarefas do |t|
      # t.index [:checklist_id, :tarefa_id]
      # t.index [:tarefa_id, :checklist_id]
      t.references :checklist, null: false, foreign_key: {on_delete: :cascade }
      t.references :tarefa, null: false, foreign_key: true
    end
  end
end

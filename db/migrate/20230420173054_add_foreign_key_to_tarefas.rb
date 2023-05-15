class AddForeignKeyToTarefas < ActiveRecord::Migration[7.0]
  def change
    add_foreign_key :tarefas, :checklists, on_delete: :cascade
  end
end

class UpdatePostoChecklistsForeignKey < ActiveRecord::Migration[7.0]
  def change
    remove_foreign_key :posto_checklists, :postos
    add_foreign_key :posto_checklists, :postos, on_delete: :cascade
  end
end

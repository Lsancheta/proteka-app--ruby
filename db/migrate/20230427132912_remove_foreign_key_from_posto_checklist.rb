class RemoveForeignKeyFromPostoChecklist < ActiveRecord::Migration[7.0]
  def change
    remove_foreign_key :posto_checklists, :checklists
  end
end

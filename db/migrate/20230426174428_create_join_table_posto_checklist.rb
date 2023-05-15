class CreateJoinTablePostoChecklist < ActiveRecord::Migration[7.0]
  def change
    create_join_table :postos, :checklists do |t|
       t.index [:posto_id, :checklist_id]
       t.index [:checklist_id, :posto_id]
    end
  end
end

class CreatePostoChecklists < ActiveRecord::Migration[7.0]
  def change
    create_table :posto_checklists do |t|
      t.references :posto, null: false, foreign_key: true
      t.references :checklist, null: false, foreign_key: true

      t.timestamps
    end
  end
end

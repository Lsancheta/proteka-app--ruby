class CreateRoteirosUsuarios < ActiveRecord::Migration[7.0]
  def change
    create_table :roteiros_usuarios, id: false do |t|
      t.references :roteiro, null: false, foreign_key: true
      t.references :usuario, null: false, foreign_key: true

      t.timestamps
    end
    add_index :roteiros_usuarios, [:roteiro_id, :usuario_id], unique: true
  end
end

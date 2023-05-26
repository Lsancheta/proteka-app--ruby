class AddIndexToUsuariosRe < ActiveRecord::Migration[7.0]
  def change
    add_index :usuarios, :re, unique: true
  end
end

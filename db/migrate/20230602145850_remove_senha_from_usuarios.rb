class RemoveSenhaFromUsuarios < ActiveRecord::Migration[7.0]
  def change
    remove_column :usuarios, :senha, :string
  end
end

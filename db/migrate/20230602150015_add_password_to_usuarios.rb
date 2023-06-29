class AddPasswordToUsuarios < ActiveRecord::Migration[7.0]
  def change
    add_column :usuarios, :password, :string
  end
end

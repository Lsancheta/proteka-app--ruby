class AddTokenToUsuarios < ActiveRecord::Migration[7.0]
  def change
    add_column :usuarios, :token, :string
  end
end

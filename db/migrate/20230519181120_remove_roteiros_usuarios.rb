class RemoveRoteirosUsuarios < ActiveRecord::Migration[7.0]
  def change
    drop_table :roteiros_usuarios
  end
end

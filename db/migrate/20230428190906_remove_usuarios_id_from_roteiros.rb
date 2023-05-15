class RemoveUsuariosIdFromRoteiros < ActiveRecord::Migration[7.0]
  def change
    remove_column :roteiros, :usuarios_id, :integer
  end
end

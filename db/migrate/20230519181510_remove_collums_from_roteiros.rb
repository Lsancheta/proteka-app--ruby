class RemoveCollumsFromRoteiros < ActiveRecord::Migration[7.0]
  def change
    remove_column :roteiros, :posto_id, :integer
    remove_column :roteiros, :usuario_id, :integer
  end
end

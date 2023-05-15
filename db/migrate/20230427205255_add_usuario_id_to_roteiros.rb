class AddUsuarioIdToRoteiros < ActiveRecord::Migration[7.0]
  def change
    add_reference :roteiros, :usuario, null: false, foreign_key: true
  end
end
